Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC32F9BC9
	for <lists.virtualization@lfdr.de>; Mon, 18 Jan 2021 10:17:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DC8E863BE;
	Mon, 18 Jan 2021 09:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vt1rXUydPwdJ; Mon, 18 Jan 2021 09:16:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57442863A6;
	Mon, 18 Jan 2021 09:16:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29B53C0FA8;
	Mon, 18 Jan 2021 09:16:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF19FC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 09:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CDB5686FB5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 09:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDwz0lf-fyrU
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 09:16:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7A0A686F88
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 09:16:52 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id x203so3933985ooa.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 01:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XSK+lvyQA4uXA5xPhZ/8h6A7IFG5qSuPlS2fMmSK9uE=;
 b=g0OihKEQp3iql/CK/5EC0JwmqXVTR+AOVENIOuGMPFsGSeHvvkxftBiA9Mu5HHh+Dt
 yvdAaWFsnRmu/efRdYIFkFNmcwDY8n4XbSXOGUbzF5HMyG2W6010KLYjXpnOvsskibZO
 41hEyNwNAI1zV/ra54yz7iIQq6oPLY47r80NacYWAAwb5D3RUTBWZXYtnHP66WVTtG6g
 9MLMjmxBLg1sV9mbRo4JoyerLfkcZl/BKB52D6wLSbFj5QWAETS8bW05NLyQ1eOxD3DM
 RwBSlkQU9mbctTrNWvRgt1eLrUWZbgF/aXRyp0nsHBbGv+pc8JZJer9XJF9JbSxim1YM
 0wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XSK+lvyQA4uXA5xPhZ/8h6A7IFG5qSuPlS2fMmSK9uE=;
 b=KDbeJhqv4YSGbLBX++GyQPfIhhoLcItTPO1+rIsvDYw40gxJ88nqgAl9qkne/PYSd3
 V4slEl4aGShPf42hmmBzniy7uiSn+qs3OrxaPHZ9OIctf2K2dLx9+pamjjAZkZWNQnXv
 rGKgTD8nB6OZTFuLcypdqBT6RjtbKciVFNM9s7MDqOyu3wYeXWmLoXra0Bb3E3tnSZ6c
 mt8NSepurOXPXcO/Cs3NEO7h7Yvh542JFmexIWRicMbtJkx/WohRMbfJs68ZcKEdG8Am
 ZTnh24gUIrYJ9hTVDR68t1PzgJ/98ps2xbnmbwpALtW66DowImHNBvGMu/Z5NRYwiqXV
 hgLA==
X-Gm-Message-State: AOAM532l+gHmythggVFJ+/Zw8c/xqvOkl4auWoHwBEienRM5I7KMXuqR
 ZgEj6r8R/nqQx9Y/ikMN3+Nwj5mhbfIpwLJV/seyeg==
X-Google-Smtp-Source: ABdhPJzqTOl3MqL0bVrAhDZtCS3mLYK4WgEB46OSUFecnlcwl11ttUt9pEepSbvh3bw3kfb4oCIECDbWZljHghrIAlk=
X-Received: by 2002:a4a:d396:: with SMTP id i22mr16311455oos.55.1610961411680; 
 Mon, 18 Jan 2021 01:16:51 -0800 (PST)
MIME-Version: 1.0
References: <20210112194143.1494-1-yuri.benditovich@daynix.com>
 <20210112194143.1494-4-yuri.benditovich@daynix.com>
 <CAOEp5Ocz-xGq5=e=WY0aipEYHEhN-wxekNaAiqAS+HsOF8TcDQ@mail.gmail.com>
 <CAOEp5OevYR5FWVMfQ_esmWTKtz9_ddTupbe7FtBFQ=sv2kEt2w@mail.gmail.com>
In-Reply-To: <CAOEp5OevYR5FWVMfQ_esmWTKtz9_ddTupbe7FtBFQ=sv2kEt2w@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 18 Jan 2021 11:16:40 +0200
Message-ID: <CAOEp5OeQscazq2bSkT7ocnHZ5q_+ffSUcBqbUZpSz+dVEDcLhg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] tun: allow use of BPF_PROG_TYPE_SCHED_CLS program
 type
To: Alexei Starovoitov <ast@kernel.org>,
 Network Development <netdev@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, bpf <bpf@vger.kernel.org>
Cc: Song Liu <songliubraving@fb.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Yan Vugenfirer <yan@daynix.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, decui@microsoft.com,
 Andrii Nakryiko <andrii@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Marco Elver <elver@google.com>, cai@lca.pw, Jakub Kicinski <kuba@kernel.org>,
 Jakub Sitnicki <jakub@cloudflare.com>, Willem de Bruijn <willemb@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Martin KaFai Lau <kafai@fb.com>
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

Hello Alexei,

Can you please answer the questions in the last email of this thread?
Your comment will be extremely helpful.

Thanks

On Tue, Jan 12, 2021 at 10:55 PM Yuri Benditovich
<yuri.benditovich@daynix.com> wrote:
>
> On Tue, Jan 12, 2021 at 10:40 PM Yuri Benditovich
> <yuri.benditovich@daynix.com> wrote:
> >
> > On Tue, Jan 12, 2021 at 9:42 PM Yuri Benditovich
> > <yuri.benditovich@daynix.com> wrote:
> > >
> > > This program type can set skb hash value. It will be useful
> > > when the tun will support hash reporting feature if virtio-net.
> > >
> > > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > > ---
> > >  drivers/net/tun.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> > > index 7959b5c2d11f..455f7afc1f36 100644
> > > --- a/drivers/net/tun.c
> > > +++ b/drivers/net/tun.c
> > > @@ -2981,6 +2981,8 @@ static int tun_set_ebpf(struct tun_struct *tun, struct tun_prog __rcu **prog_p,
> > >                 prog = NULL;
> > >         } else {
> > >                 prog = bpf_prog_get_type(fd, BPF_PROG_TYPE_SOCKET_FILTER);
> > > +               if (IS_ERR(prog))
> > > +                       prog = bpf_prog_get_type(fd, BPF_PROG_TYPE_SCHED_CLS);
> > >                 if (IS_ERR(prog))
> > >                         return PTR_ERR(prog);
> > >         }
> >
> > Comment from Alexei Starovoitov:
> > Patches 1 and 2 are missing for me, so I couldn't review properly,
> > but this diff looks odd.
> > It allows sched_cls prog type to attach to tun.
> > That means everything that sched_cls progs can do will be done from tun hook?
>
> We do not have an intention to modify the packet in this steering eBPF.
> There is just one function that unavailable for BPF_PROG_TYPE_SOCKET_FILTER
> that the eBPF needs to make possible to deliver the hash to the guest
> VM - it is 'bpf_set_hash'
>
> Does it mean that we need to define a new eBPF type for socket filter
> operations + set_hash?
>
> Our problem is that the eBPF calculates 32-bit hash, 16-bit queue
> index and 8-bit of hash type.
> But it is able to return only 32-bit integer, so in this set of
> patches the eBPF returns
> queue index and hash type and saves the hash in skb->hash using bpf_set_hash().
>
> If this is unacceptable, can you please recommend a better solution?
>
> > sched_cls assumes l2 and can modify the packet.
>
> The steering eBPF in TUN module also assumes l2.
>
> > I think crashes are inevitable.
> >
> > > --
> > > 2.17.1
> > >
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
