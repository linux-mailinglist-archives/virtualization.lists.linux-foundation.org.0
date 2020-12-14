Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ECA2D9195
	for <lists.virtualization@lfdr.de>; Mon, 14 Dec 2020 02:33:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD8BA86845;
	Mon, 14 Dec 2020 01:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbYiZXM-o2rp; Mon, 14 Dec 2020 01:33:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0F7086849;
	Mon, 14 Dec 2020 01:33:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6E72C013B;
	Mon, 14 Dec 2020 01:33:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44072C013B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 01:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2766E857BF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 01:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUN20lCiEWCJ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 01:33:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 17183857A3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 01:33:21 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id b9so20366175ejy.0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 13 Dec 2020 17:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ufj2Iq9YciaonnGoHIm8LQWHySzfZ2ZpGbsx76Hg1BQ=;
 b=LwO7WtZLLeatk7VoGpFQVD0BI0Df/ahV0fiCGA9HYtyFC9Nhj3/cRrgfxY7XcWjTwj
 RHtFejRX9uYdrOJCgVg+DM4kRCQwfv+kBMiXLpWl1VJQcD5qDNWaDQI88u2nNcKoEpj+
 cBnP5SFI6U7D1eIbzyraz6kcHVq7CgVENkINlY8ta23wpPYKA/CfDxR64dunLjW2EkBe
 8QIe9LYMpCuqVjIHw0DbJqkbKqOyf+yUCpXJ4J4tw/1hOg/5+7lqO69saC8bJofj3J2N
 CnZ8ldgszIwrQH9x5qz3/cHQ7YIsj+H1AJZxUIuRILLJX0TOZ3RAH4GWkQ21vszD7KEF
 E4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ufj2Iq9YciaonnGoHIm8LQWHySzfZ2ZpGbsx76Hg1BQ=;
 b=M13O6b4TSNFBKiIYitP5rVZ+raG4OTNehcmyJ5EY9IRIAF7bQGn9NhMc4dOdMycRZ/
 REDsXxHNc478U93i6aPo6mwPHPR2eQ8cnpjO5silqz9z6u1BpwlV7gBCq0q7wVopWhWX
 nZodUJtKICl3dM7B6YMx61mdGH/WVxVUOoIrishvA5fugDYrQNN5Yk16TtGNQGkzRP5R
 wH2DOkaRs5oMNLcthTh7RPzzd2yQzj/4zzwQ9URvIBlIkadqub8xis1prG3zi+i9ShJa
 IkLOrR+DPLR9aIymVYo0omFiumelcj2crvdReBVzSTO8oni8MnXEoeX5hPAkgTH3kBIR
 +xpw==
X-Gm-Message-State: AOAM53001z5f5laEkgbsrzUBCDcp9cIPX21yVDjozaXY3nW/lfZNwhnB
 fMcoA3fswjPb5f9OIsl2fAs0b752EyCwPTe7Rlk=
X-Google-Smtp-Source: ABdhPJxvt8CvJ9cemskE/wqcGLeQe/L3TdIfTkPerfoBZb6XZ6IL2on8BCxwz6RAvlsqRwaIuwX+pR35XXSaqoMB1bQ=
X-Received: by 2002:a17:906:1796:: with SMTP id
 t22mr4429019eje.11.1607909599492; 
 Sun, 13 Dec 2020 17:33:19 -0800 (PST)
MIME-Version: 1.0
References: <1606982459-41752-1-git-send-email-wangyunjian@huawei.com>
 <1607517703-18472-1-git-send-email-wangyunjian@huawei.com>
 <CA+FuTSfQoDr0jd76xBXSvchhyihQaL2UQXeCR6frJ7hyXxbmVA@mail.gmail.com>
 <34EFBCA9F01B0748BEB6B629CE643AE60DB6E3B3@dggemm513-mbx.china.huawei.com>
 <CA+FuTSdVJa4JQzzybZ17WDcfokA2RZ043kh5++Zgy5aNNebj0A@mail.gmail.com>
In-Reply-To: <CA+FuTSdVJa4JQzzybZ17WDcfokA2RZ043kh5++Zgy5aNNebj0A@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sun, 13 Dec 2020 20:32:43 -0500
Message-ID: <CAF=yD-LF+j1vpzKDtBVUi22ZkTCEnMAXgfLfoQTBO+95D6RGRA@mail.gmail.com>
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

On Sat, Dec 12, 2020 at 7:18 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> > > > afterwards, the error handling in vhost handle_tx() will try to
> > > > decrease the same refcount again. This is wrong and fix this by delay
> > > > copying ubuf_info until we're sure there's no errors.
> > >
> > > I think the right approach is to address this in the error paths, rather than
> > > complicate the normal datapath.
> > >
> > > Is it sufficient to suppress the call to vhost_net_ubuf_put in the handle_tx
> > > sendmsg error path, given that vhost_zerocopy_callback will be called on
> > > kfree_skb?
> >
> > We can not call kfree_skb() until the skb was created.
> >
> > >
> > > Or alternatively clear the destructor in drop:
> >
> > The uarg->callback() is called immediately after we decide do datacopy
> > even if caller want to do zerocopy. If another error occurs later, the vhost
> > handle_tx() will try to decrease it again.
>
> Oh right, I missed the else branch in this path:
>
>         /* copy skb_ubuf_info for callback when skb has no error */
>         if (zerocopy) {
>                 skb_shinfo(skb)->destructor_arg = msg_control;
>                 skb_shinfo(skb)->tx_flags |= SKBTX_DEV_ZEROCOPY;
>                 skb_shinfo(skb)->tx_flags |= SKBTX_SHARED_FRAG;
>         } else if (msg_control) {
>                 struct ubuf_info *uarg = msg_control;
>                 uarg->callback(uarg, false);
>         }
>
> So if handle_tx_zerocopy calls tun_sendmsg with ubuf_info (and thus a
> reference to release), there are these five options:
>
> 1. tun_sendmsg succeeds, ubuf_info is associated with skb.
>      reference released from kfree_skb calling vhost_zerocopy_callback later
>
> 2. tun_sendmsg succeeds, ubuf_info is released immediately, as skb is
> not zerocopy.
>
> 3. tun_sendmsg fails before creating skb, handle_tx_zerocopy correctly
> cleans up on receiving error from tun_sendmsg.
>
> 4. tun_sendmsg fails after creating skb, but with copying: decremented
> at branch shown above + again in handle_tx_zerocopy
>
> 5. tun_sendmsg fails after creating skb, with zerocopy: decremented at
> kfree_skb in drop: + again in handle_tx_zerocopy
>
> Since handle_tx_zerocopy has no idea whether on error 3, 4 or 5
> occurred,

Actually, it does. If sendmsg returns an error, it can test whether
vq->heads[nvq->upend_idx].len != VHOST_DMA_IN_PROGRESS.

> either all decrement-on-error cases must be handled by
> handle_tx_zerocopy or none.
>
> Your patch chooses the latter. Makes sense.
>
> But can this still go wrong if the xdp path is taken, but no program
> exists or the program returns XDP_PASS. And then the packet hits an
> error path, such as ! IFF_UP?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
