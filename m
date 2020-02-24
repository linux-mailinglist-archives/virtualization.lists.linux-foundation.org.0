Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA7816B0E2
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 21:21:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 539DE8583C;
	Mon, 24 Feb 2020 20:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-j8-8Rfs9aP; Mon, 24 Feb 2020 20:21:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B929F85B5D;
	Mon, 24 Feb 2020 20:21:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99390C0177;
	Mon, 24 Feb 2020 20:21:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0052BC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 20:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EE89220524
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 20:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LbTxWWDDziV
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 20:21:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 2C92320395
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 20:21:34 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id b196so4832195yba.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nEJM8yTdyUbhN2ATPuO/jWnU2UZaTd8jjC8sXAHqFQ=;
 b=ft0SFe/z22U1TyjHYjZhIL1FD0josSLoJX2cTgyBz7Kyp2KAsA6pSpkZfC6FS/FF4v
 mZEkEluTSY18I+ksbZghWDXr4dZpNqkDvK1mvdFErJfTOZda86m1A9XGKnoZEZcMxzzC
 qKPWp3NGt7Ic8ap5OiZgcrFY0prGNB6DkytrIrfzEUxD4H4a1JlgoPQUiKz+woN6EoxY
 /KZt2S+DSHeSslmeKecNpBtgbYKjm99AbLx9sRJqBWcIE+rqluo5g4XMuYJunu7PVwtG
 tcKdlleikMrQIc8BJlMLDCu3BqCmjNcxYZGYc6+Btj4MpExIAekAzdG0uZehvfY1s2ew
 Tf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nEJM8yTdyUbhN2ATPuO/jWnU2UZaTd8jjC8sXAHqFQ=;
 b=F263fmCXdZ9TQ4hdHBr2UtZOUEtmjFUpu7CZyfkthPHn1+eW/WBDVJrum07fuXP73H
 9Fy1/nAnrsl/CHpBdHVq3K0xMk1X8+xx949vlQf+AUfhnYL3LuX1tOGp6HnG1oage95S
 RfljbVlx8rNfoY9mZoozy3x1Vb8yh4x2V/35CFSWUp2c1ap2yN1T3jI7IhCIGdeQuY2i
 vXz/C4Y0yhLBAMiSUFeJnXmrc4HtbLQYmo+abwmUB6Z2P5Mr6fGUJ2yin23SeClLU4cj
 uZYcKUO24gi0R/BbJnpSxXxidQFjnspijXP0EVAKQ/4W/1rdxazFkhFox3cwjhUyqtAw
 KN7g==
X-Gm-Message-State: APjAAAVlnlMEW+HxdENdIvrH4MbqH5PtMGNhHaXQACmZ9RimJSRoLJtD
 XyXdUMBEmG4NlpqO1wDm+Y2GgeCk
X-Google-Smtp-Source: APXvYqyNAGGysXnYwmtAWnnJXdBjM0kk7X0L/6zcEhX1Huq5A9lmAr+3DaBLMib/Tu/JChgrERgfOg==
X-Received: by 2002:a25:d7c9:: with SMTP id
 o192mr46562040ybg.384.1582575692300; 
 Mon, 24 Feb 2020 12:21:32 -0800 (PST)
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com.
 [209.85.161.44])
 by smtp.gmail.com with ESMTPSA id q130sm5665077ywg.52.2020.02.24.12.21.30
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 12:21:31 -0800 (PST)
Received: by mail-yw1-f44.google.com with SMTP id a125so5807123ywe.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 12:21:30 -0800 (PST)
X-Received: by 2002:a81:6588:: with SMTP id
 z130mr39338605ywb.355.1582575690106; 
 Mon, 24 Feb 2020 12:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
 <CA+FuTSd8P6uQnwisZEh7+nfowW9qKLBEvA4GPg+xUkjBa-6TDA@mail.gmail.com>
 <4e7757cf-148e-4585-b358-3b38f391275d@cambridgegreys.com>
In-Reply-To: <4e7757cf-148e-4585-b358-3b38f391275d@cambridgegreys.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 24 Feb 2020 15:20:53 -0500
X-Gmail-Original-Message-ID: <CA+FuTSdOCJZCVS4xohx+BQmkmq8JALnK=gGc0=qy1TbjY707ag@mail.gmail.com>
Message-ID: <CA+FuTSdOCJZCVS4xohx+BQmkmq8JALnK=gGc0=qy1TbjY707ag@mail.gmail.com>
Subject: Re: [PATCH v3] virtio: Work around frames incorrectly marked as gso
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>, linux-um@lists.infradead.org,
 virtualization@lists.linux-foundation.org
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

On Mon, Feb 24, 2020 at 2:55 PM Anton Ivanov
<anton.ivanov@cambridgegreys.com> wrote:
>
> On 24/02/2020 19:27, Willem de Bruijn wrote:
> > On Mon, Feb 24, 2020 at 8:26 AM <anton.ivanov@cambridgegreys.com> wrote:
> >>
> >> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> >>
> >> Some of the locally generated frames marked as GSO which
> >> arrive at virtio_net_hdr_from_skb() have no GSO_TYPE, no
> >> fragments (data_len = 0) and length significantly shorter
> >> than the MTU (752 in my experiments).
> >
> > Do we understand how these packets are generated?
>
> No, we have not been able to trace them.
>
> The only thing we know is that this is specific to locally generated
> packets. Something arriving from the network does not show this.
>
> > Else it seems this
> > might be papering over a deeper problem.
> >
> > The stack should not create GSO packets less than or equal to
> > skb_shinfo(skb)->gso_size. See for instance the check in
> > tcp_gso_segment after pulling the tcp header:
> >
> >          mss = skb_shinfo(skb)->gso_size;
> >          if (unlikely(skb->len <= mss))
> >                  goto out;
> >
> > What is the gso_type, and does it include SKB_GSO_DODGY?
> >
>
>
> 0 - not set.

Thanks for the follow-up details. Is this something that you can trigger easily?

An skb_dump() + dump_stack() when the packet socket gets such a
packet may point us to the root cause and fix that.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
