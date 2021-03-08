Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3AD33158E
	for <lists.virtualization@lfdr.de>; Mon,  8 Mar 2021 19:12:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E366583A8B;
	Mon,  8 Mar 2021 18:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtHrnLG_i5yU; Mon,  8 Mar 2021 18:12:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBA4B83AD9;
	Mon,  8 Mar 2021 18:12:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DED5C0001;
	Mon,  8 Mar 2021 18:12:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D7E2C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Mar 2021 18:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E736400F8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Mar 2021 18:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PeuOu3L3pQe1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Mar 2021 18:12:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CA35400D5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Mar 2021 18:12:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id hs11so22242717ejc.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Mar 2021 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OqopxqISgbDC0SR+TF4LgpGs83P68cEOgU0oL+9mBy0=;
 b=rK4orARib+uFue26kj7MItzjbMeCQujuEDB+aGDeIbin57sP23YVBgNZsvAxZ2H28v
 YnNz46zJWdkav61XGtp4BuQc2/KlwBhX3wlN0n6jMM9STBkezask2A7Fl3DxRM5R0mbb
 8SeMgsh5Y7LeqSf/6iRHsTYBPkntQaOqEogzT5gszPvnQAWC9LpHNHLYhh0r3hcZI5Yr
 9i5A84YYMdUZUcQnGNPFpp2FmYojMQuyy2aOPKeQg6OxP5w3ey768Pwtajg1mBjHRNpH
 PDLfuJ0VviolFVEl/DEyob/fNM0ZzFnJfYRt1685C/d7RqbZKTIriWmB+y0DuwtUsLK7
 GjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OqopxqISgbDC0SR+TF4LgpGs83P68cEOgU0oL+9mBy0=;
 b=FsteRpE/OiDskzuBTk5zxFQW/d4+OBHpGLT/bcaYJEaZd1uyBp2m7bXIselcmE2fFf
 zxztLSR0+mDTo9JAn7oyYzqrcgABJFkODdbW29FE+1kLkeQbDP0KVnlXU3lHlLfVQvUG
 ctYDR/gqjT/pp4Wb1Ock24S+S5qi//S6r4itTeN5+gtrN/VSyNHkepjUNxqqr0ISM71M
 ZCAaR5Hly1bnS6YPYFImBOzxd0jJL9t5nYS6fiTzBUimf0qbe9uPhKZ7zgcolhGtuCkn
 M9kwKNsWj527TRMxXzH5qHdGGio5YtqLJGz4BHRWxUL9oKaMjBn9JXiMxGdjINYU3uef
 AUuw==
X-Gm-Message-State: AOAM530BpH+Qk+Pe8sGR2Rlzr8/xloIExnLzDssQ0jEmwa+928Iv5o4A
 5DYfkC3zr5fIY1M7+cemSosdjJweGbM=
X-Google-Smtp-Source: ABdhPJzZhtA9eE7HxqjeY87BEgl0HiXMVuWuVI1n9EYFeRnFoCm+2F5E9aOAuv5w5IBWGHuTiSaEQw==
X-Received: by 2002:a17:906:b297:: with SMTP id
 q23mr16500797ejz.315.1615227131911; 
 Mon, 08 Mar 2021 10:12:11 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id f3sm7150766ejd.42.2021.03.08.10.12.10
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 10:12:10 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id j2so12446977wrx.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Mar 2021 10:12:10 -0800 (PST)
X-Received: by 2002:adf:ee92:: with SMTP id b18mr22954054wro.275.1615227129949; 
 Mon, 08 Mar 2021 10:12:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615199056.git.bnemeth@redhat.com>
 <85e04e1e6367f19c8f538d145b32f5bb93788d8a.1615199056.git.bnemeth@redhat.com>
 <CA+FuTSdWSCzkB7sDn+_0Oxy8JqmqL=nsQXP_3bnb4Xdd=0A=KQ@mail.gmail.com>
 <718e4f13-31a8-037c-9725-08ae3cd93ccd@gmail.com>
 <543ebc518aa31f04bb6a85b66f37d984ede4b031.camel@redhat.com>
 <f1fc417e-946b-6e92-3650-865834c289f3@gmail.com>
In-Reply-To: <f1fc417e-946b-6e92-3650-865834c289f3@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 8 Mar 2021 13:11:30 -0500
X-Gmail-Original-Message-ID: <CA+FuTSdZyePKSOz=r48VaoiF_yFGYxHFnh+FYYCh4KrOpPJ-xw@mail.gmail.com>
Message-ID: <CA+FuTSdZyePKSOz=r48VaoiF_yFGYxHFnh+FYYCh4KrOpPJ-xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] net: avoid infinite loop in mpls_gso_segment when
 mpls_hlen == 0
To: David Ahern <dsahern@gmail.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Balazs Nemeth <bnemeth@redhat.com>,
 David Miller <davem@davemloft.net>
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

On Mon, Mar 8, 2021 at 11:43 AM David Ahern <dsahern@gmail.com> wrote:
>
> On 3/8/21 9:26 AM, Balazs Nemeth wrote:
> > On Mon, 2021-03-08 at 09:17 -0700, David Ahern wrote:
> >> On 3/8/21 9:07 AM, Willem de Bruijn wrote:
> >>>> diff --git a/net/mpls/mpls_gso.c b/net/mpls/mpls_gso.c
> >>>> index b1690149b6fa..cc1b6457fc93 100644
> >>>> --- a/net/mpls/mpls_gso.c
> >>>> +++ b/net/mpls/mpls_gso.c
> >>>> @@ -27,7 +27,7 @@ static struct sk_buff *mpls_gso_segment(struct
> >>>> sk_buff *skb,
> >>>>
> >>>>         skb_reset_network_header(skb);
> >>>>         mpls_hlen = skb_inner_network_header(skb) -
> >>>> skb_network_header(skb);
> >>>> -       if (unlikely(!pskb_may_pull(skb, mpls_hlen)))
> >>>> +       if (unlikely(!mpls_hlen || !pskb_may_pull(skb,
> >>>> mpls_hlen)))
> >>>>                 goto out;
> >>>
> >>> Good cathc. Besides length zero, this can be more strict: a label
> >>> is
> >>> 4B, so mpls_hlen needs to be >= 4B.
> >>>
> >>> Perhaps even aligned to 4B, too, but not if there may be other
> >>> encap on top.

On second thought, since mpls_gso_segment pulls all these headers, it
is correct to require it to be a multiple of MPLS_HLEN.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
