Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB322FD897
	for <lists.virtualization@lfdr.de>; Wed, 20 Jan 2021 19:45:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AC07B203D8;
	Wed, 20 Jan 2021 18:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsnytvHkDZvy; Wed, 20 Jan 2021 18:45:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 79FC3203B9;
	Wed, 20 Jan 2021 18:45:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA36C013A;
	Wed, 20 Jan 2021 18:45:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4502C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 18:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A1F36863A3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 18:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMAvdPF4JXIw
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 18:45:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6EF8A85CD0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 18:45:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id o13so35534387lfr.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 10:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zrMNRZvlEESWdG6jggtCoB+4numwazy+fXWH/nTPU9U=;
 b=GbiCYI2AOS9Mde7ZZGAB8iKTEaPVyUk3NJn7BsJ4aNMPDW3bfjjQOlDjJVeyI01LfK
 yGrcSPsCfKcKMod8xBD3FRFhA2PKjb0+UA9u+c+PLBc6ucvOs4H76CCyWbj5qRgGzSxL
 YYeBDYP7YKSgdZ2tcOGzhxRWs+uk1fru9f/FsIBpFq4b3uFMzw/dOgkhsRnbJz85JTGD
 OFp28kiITVDeZNpIvktOImEsP9FYI+HUZ15TQ4xgjNS0A45AjvFeCkc/hiGkbKW6oV51
 UkYN9KTEvNSswvk+NvyWRYiqpqIG5SqjCPISQdicL2egTc1jJYF1v01KBc8Pl6R7uTGn
 P/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zrMNRZvlEESWdG6jggtCoB+4numwazy+fXWH/nTPU9U=;
 b=m80AXq48hs8pU4HBo15FA9yo9rYG/LcP8VsWhJN56AqI3OvWfAaKgmvjMDIC3ZgGa/
 Tr5viLQsjo/FRZBhO9xt0YSTp8LUxJlokOHT1ESs8NfSTX2PzrAqnGyGIKTwCInZERH9
 Wfxc920eVKaIACuv2os3fb7Mzs0fH3HtZZnRB7hIPvhchYCXH70ZV9fZK0IsA5I4vx2x
 G4ZYBHFMapkLX7ISjwYHCQv/sZ7FQb5yezYxqhLtrqcPAY6xD8wxMdgEddHAWFREe7VV
 pO0fNhDWeuS7aIsPnYLVV1alBZkJuWI2UblD4dVK90EBHT3yjWq2iPjXWjHMa4wHZXdQ
 hTlQ==
X-Gm-Message-State: AOAM530d6Qc/HjvR1+8m1AkS0VW7idkzxvhhJS3Jr9QYhd2BzB3Bpk47
 64n/iR/3FoewZaB0q6uPhRMXxIj40uEaKXlPvto=
X-Google-Smtp-Source: ABdhPJysfNizrzDQUVINGOhhgWus7azEpICiAnwV+p4EXlvDkyaX1pVlGFfbUwglU72IpLHWW5TDXiNALg3A++evFDI=
X-Received: by 2002:a05:6512:34c5:: with SMTP id
 w5mr4908698lfr.214.1611168309505; 
 Wed, 20 Jan 2021 10:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20210112194143.1494-1-yuri.benditovich@daynix.com>
 <20210112194143.1494-4-yuri.benditovich@daynix.com>
 <CAOEp5Ocz-xGq5=e=WY0aipEYHEhN-wxekNaAiqAS+HsOF8TcDQ@mail.gmail.com>
 <CAOEp5OevYR5FWVMfQ_esmWTKtz9_ddTupbe7FtBFQ=sv2kEt2w@mail.gmail.com>
In-Reply-To: <CAOEp5OevYR5FWVMfQ_esmWTKtz9_ddTupbe7FtBFQ=sv2kEt2w@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 20 Jan 2021 10:44:58 -0800
Message-ID: <CAADnVQJLN0sFyKdAmc6Pikv8Ww9OocnK_VXMG=ZLSMONHkqe4Q@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] tun: allow use of BPF_PROG_TYPE_SCHED_CLS program
 type
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: Song Liu <songliubraving@fb.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Yan Vugenfirer <yan@daynix.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, decui@microsoft.com,
 Andrii Nakryiko <andrii@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Marco Elver <elver@google.com>, KP Singh <kpsingh@kernel.org>, cai@lca.pw,
 Jakub Kicinski <kuba@kernel.org>, virtualization@lists.linux-foundation.org,
 Jakub Sitnicki <jakub@cloudflare.com>, Willem de Bruijn <willemb@google.com>,
 Network Development <netdev@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, gustavoars@kernel.org,
 "David S. Miller" <davem@davemloft.net>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>
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

On Tue, Jan 12, 2021 at 12:55 PM Yuri Benditovich
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

The intent is irrelevant. Using SCHED_CLS here will let users modify the packet
and some users will do so. Hence the tun code has to support it.

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

bpf prog can only return a 32-bit integer. That's true.
But the prog can use helpers to set any number of bits and variables.
bpf_set_hash_v2() with hash, queue and index arguments could fit this purpose,
but if you allow it for SCHED_CLS type,
tc side of the code should be ready to deal with that too and this extended
helper should be meaningful for both tc and tun.

In general if the purpose of the prog is to compute three values they better be
grouped together. Returned two of them via ORed 32-bit integer and
returning 32-bit via bpf_set_hash is an awkward api.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
