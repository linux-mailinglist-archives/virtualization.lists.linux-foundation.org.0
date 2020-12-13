Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD482D8AB9
	for <lists.virtualization@lfdr.de>; Sun, 13 Dec 2020 01:18:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AC89686E54;
	Sun, 13 Dec 2020 00:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2ryhjDH8EsI; Sun, 13 Dec 2020 00:18:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DC7B786E35;
	Sun, 13 Dec 2020 00:18:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6C02C013B;
	Sun, 13 Dec 2020 00:18:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B1FCC013B
 for <virtualization@lists.linux-foundation.org>;
 Sun, 13 Dec 2020 00:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 494152E0E3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 13 Dec 2020 00:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2d6KJfWG-tN1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 13 Dec 2020 00:18:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 1C6A22270C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 13 Dec 2020 00:18:19 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id s23so4219383uaq.10
 for <virtualization@lists.linux-foundation.org>;
 Sat, 12 Dec 2020 16:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/H+T2rO16oywKEC4ZjUTgkusa3PshH0cBx2kr1UDE/Y=;
 b=VgEIJO+ocNvU9Sd2VBg8gyc60lHua3q5wN1OIcd14NxtcHw6YwvzoJjTCOTQ/7weFJ
 Xyg5zaVVeB1KHR4B9ZRnCS/BvynCyVXIGKBzgJzjliYazYk7LA1nVokcJ/mYz1aCoz5A
 7egBbfnOUjpWSOMIzVp90QsNFO4jTe2cwztZ/EiA0texZgszIhKn+D0hJT1fKsS5cjlt
 W1F7vV2wxHwyAYf9gHXDELfAv6mupoZd/Byh000AFuXFtqide+CWWiT9+ACgWWdXYfuC
 MOIz+ilYT0E8YopMkKD9t5o2KA5SUAGi8VkjP8FJoHHomYZEY/0VxsNvXw/6HCPcWiOi
 3sbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/H+T2rO16oywKEC4ZjUTgkusa3PshH0cBx2kr1UDE/Y=;
 b=UzlAvtavmok6x2xMcPVGJao/2f8thgQ9EeqE6tDSO23xtwEH7MkZyBZYfsstEkKvLK
 VaobisQ7gyqHebZE+CFWT7ElbeSMDmUe89VhaltXVZR50+RLYd5CRmVSKtPtkK+J+c5j
 BrrRVKijrpnmdK1rg9HGypf2yT+YH1uT9xfmWfIrpe8v+5ChYIyfq9lykzHF4MVpmRqi
 baQ6TQQ6ijspZ/LXQCd4U0s7TAkwfBxBNsHAZL2dYmDdcsSOw/Bbi2U8626159zHK3LN
 pa+WHLYR+nG3q6bmCrkwDhrXWnw1Qqinz71a4SrnT73XbaFDA6Kk+9dEeYBfctSqnUlW
 GMSQ==
X-Gm-Message-State: AOAM531dXmZmHKURmKafXMQcbkk6DQbCG2b/9IZYtNNAT+2zVrIMsEq0
 T6VbLM51TzVN5EwAsb1LPaLe8PruDn0=
X-Google-Smtp-Source: ABdhPJzlg5IW+yWZlWKhe41QRlZYuU6pkfdKNYJFNRCNFrku5rFwUoFHtn9psVn5LN6waQ1C49R8aQ==
X-Received: by 2002:ab0:14ca:: with SMTP id f10mr16834987uae.142.1607818697461; 
 Sat, 12 Dec 2020 16:18:17 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
 by smtp.gmail.com with ESMTPSA id o1sm1464464uao.14.2020.12.12.16.18.15
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Dec 2020 16:18:16 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id b23so6948767vsp.9
 for <virtualization@lists.linux-foundation.org>;
 Sat, 12 Dec 2020 16:18:15 -0800 (PST)
X-Received: by 2002:a67:bd0a:: with SMTP id y10mr16985677vsq.28.1607818695444; 
 Sat, 12 Dec 2020 16:18:15 -0800 (PST)
MIME-Version: 1.0
References: <1606982459-41752-1-git-send-email-wangyunjian@huawei.com>
 <1607517703-18472-1-git-send-email-wangyunjian@huawei.com>
 <CA+FuTSfQoDr0jd76xBXSvchhyihQaL2UQXeCR6frJ7hyXxbmVA@mail.gmail.com>
 <34EFBCA9F01B0748BEB6B629CE643AE60DB6E3B3@dggemm513-mbx.china.huawei.com>
In-Reply-To: <34EFBCA9F01B0748BEB6B629CE643AE60DB6E3B3@dggemm513-mbx.china.huawei.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sat, 12 Dec 2020 19:17:39 -0500
X-Gmail-Original-Message-ID: <CA+FuTSdVJa4JQzzybZ17WDcfokA2RZ043kh5++Zgy5aNNebj0A@mail.gmail.com>
Message-ID: <CA+FuTSdVJa4JQzzybZ17WDcfokA2RZ043kh5++Zgy5aNNebj0A@mail.gmail.com>
Subject: Re: [PATCH net v2] tun: fix ubuf refcount incorrectly on error path
To: wangyunjian <wangyunjian@huawei.com>
Cc: Willem de Bruijn <willemb@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>,
 "Lilijun \(Jerry\)" <jerry.lilijun@huawei.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, xudingke <xudingke@huawei.com>,
 "huangbin \(J\)" <brian.huangbin@huawei.com>,
 chenchanghu <chenchanghu@huawei.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

> > > afterwards, the error handling in vhost handle_tx() will try to
> > > decrease the same refcount again. This is wrong and fix this by delay
> > > copying ubuf_info until we're sure there's no errors.
> >
> > I think the right approach is to address this in the error paths, rather than
> > complicate the normal datapath.
> >
> > Is it sufficient to suppress the call to vhost_net_ubuf_put in the handle_tx
> > sendmsg error path, given that vhost_zerocopy_callback will be called on
> > kfree_skb?
>
> We can not call kfree_skb() until the skb was created.
>
> >
> > Or alternatively clear the destructor in drop:
>
> The uarg->callback() is called immediately after we decide do datacopy
> even if caller want to do zerocopy. If another error occurs later, the vhost
> handle_tx() will try to decrease it again.

Oh right, I missed the else branch in this path:

        /* copy skb_ubuf_info for callback when skb has no error */
        if (zerocopy) {
                skb_shinfo(skb)->destructor_arg = msg_control;
                skb_shinfo(skb)->tx_flags |= SKBTX_DEV_ZEROCOPY;
                skb_shinfo(skb)->tx_flags |= SKBTX_SHARED_FRAG;
        } else if (msg_control) {
                struct ubuf_info *uarg = msg_control;
                uarg->callback(uarg, false);
        }

So if handle_tx_zerocopy calls tun_sendmsg with ubuf_info (and thus a
reference to release), there are these five options:

1. tun_sendmsg succeeds, ubuf_info is associated with skb.
     reference released from kfree_skb calling vhost_zerocopy_callback later

2. tun_sendmsg succeeds, ubuf_info is released immediately, as skb is
not zerocopy.

3. tun_sendmsg fails before creating skb, handle_tx_zerocopy correctly
cleans up on receiving error from tun_sendmsg.

4. tun_sendmsg fails after creating skb, but with copying: decremented
at branch shown above + again in handle_tx_zerocopy

5. tun_sendmsg fails after creating skb, with zerocopy: decremented at
kfree_skb in drop: + again in handle_tx_zerocopy

Since handle_tx_zerocopy has no idea whether on error 3, 4 or 5
occurred, either all decrement-on-error cases must be handled by
handle_tx_zerocopy or none.

Your patch chooses the latter. Makes sense.

But can this still go wrong if the xdp path is taken, but no program
exists or the program returns XDP_PASS. And then the packet hits an
error path, such as ! IFF_UP?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
