Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBBE1F66A5
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:30:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2472287629;
	Thu, 11 Jun 2020 11:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-FmTpOeII8Z; Thu, 11 Jun 2020 11:30:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88F07876F3;
	Thu, 11 Jun 2020 11:30:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 496D9C016F;
	Thu, 11 Jun 2020 11:30:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6395FC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5B5F2895C1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3u71zj-9oi7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:30:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 06E28895BA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9/jl7PRjuNx/C+pUMDHawKvKRMB5jFyju67YAOMh5Vw=;
 b=K7vMxZEreFMxTGl9sC1Xvi09Zg/bq+oJvjcv5mvk4M3nsPR2DQVrqAISV5Fpjod4nfY0fZ
 +M9cK2m17IX8fm1ru8e+tNogakwn3rFAn+V3TFl/Nw055WLbdq8sADW6tcxDM5CqA6TOcT
 UelvBpknphft7BB6GVbKlrzIG+if/5s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-w470WcYAPcGq4h9H4g0Wag-1; Thu, 11 Jun 2020 07:30:19 -0400
X-MC-Unique: w470WcYAPcGq4h9H4g0Wag-1
Received: by mail-wr1-f70.google.com with SMTP id p9so2453811wrx.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9/jl7PRjuNx/C+pUMDHawKvKRMB5jFyju67YAOMh5Vw=;
 b=hdHaPz/buJsyOTJ0LsODA1NmFKxHtWM6da1jKW+7zIkYzbBWMCCzAYMo2Cxv4W4yuK
 N3GvOPgyPjhzBADcbkVlonviR5Iqxbh4Jx/uz2zrN2ughILF55bRwE6FW8lFOXqmo0Xx
 WIO7oZbc16zHpMH2uSnYI/vDLLNWJJg78vEOLbdXSjEj1JN5yK8PEUVEOvonvlr+T2T3
 LYEL84r6jH2j0Uurrii5EDwMiGzN55I5xrpsfITmPhJjUy8V2I2CXEfFsFZheXl9RbBk
 u3lMdJZS7oV+Dkdxb2zHH4H+cnDkV8ChhTsZgVtoCVaKK95m2VNPhO1BgzzZxQzqtL9b
 i5Hg==
X-Gm-Message-State: AOAM53351H3tFW0a4jss8VM08CIsLxsjITNLH57HOdkBlY8pan4pCQG6
 QlFVEGr31Yt377SGkVDEzCYPhaX6/f8VDA7tB9zWVwuxyuWcG7G4ELOBKMtPSoRl7vVCNxnXFD+
 5G6O4eB0WLJZ7Db1pQwdk3YOwOSGJgms+MdyYC55zhg==
X-Received: by 2002:a1c:3b8b:: with SMTP id i133mr7709145wma.111.1591875017439; 
 Thu, 11 Jun 2020 04:30:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzJ6v/QkioaQycgPSzfq+keXBu76wlWx/mu62TPOFBjqUGGd1L5f5cXkoDx4uk2vFtzgVdWQ==
X-Received: by 2002:a1c:3b8b:: with SMTP id i133mr7709124wma.111.1591875017186; 
 Thu, 11 Jun 2020 04:30:17 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id b81sm4055054wmc.5.2020.06.11.04.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:30:16 -0700 (PDT)
Date: Thu, 11 Jun 2020 07:30:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v7 03/14] vhost: use batched get_vq_desc version
Message-ID: <20200611072702-mutt-send-email-mst@kernel.org>
References: <20200610113515.1497099-1-mst@redhat.com>
 <20200610113515.1497099-4-mst@redhat.com>
 <CAJaqyWdGKh5gSTndGuVPyJSgt3jfjfW4xNCrJ2tQ9f+mD8=sMQ@mail.gmail.com>
 <20200610111147-mutt-send-email-mst@kernel.org>
 <CAJaqyWe6d19hFAbpqaQqOPuQQmBQyevyF4sTVkaXKhD729XDkw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWe6d19hFAbpqaQqOPuQQmBQyevyF4sTVkaXKhD729XDkw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm list <kvm@vger.kernel.org>, virtualization@lists.linux-foundation.org
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

On Wed, Jun 10, 2020 at 06:18:32PM +0200, Eugenio Perez Martin wrote:
> On Wed, Jun 10, 2020 at 5:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jun 10, 2020 at 02:37:50PM +0200, Eugenio Perez Martin wrote:
> > > > +/* This function returns a value > 0 if a descriptor was found, or 0 if none were found.
> > > > + * A negative code is returned on error. */
> > > > +static int fetch_descs(struct vhost_virtqueue *vq)
> > > > +{
> > > > +       int ret;
> > > > +
> > > > +       if (unlikely(vq->first_desc >= vq->ndescs)) {
> > > > +               vq->first_desc = 0;
> > > > +               vq->ndescs = 0;
> > > > +       }
> > > > +
> > > > +       if (vq->ndescs)
> > > > +               return 1;
> > > > +
> > > > +       for (ret = 1;
> > > > +            ret > 0 && vq->ndescs <= vhost_vq_num_batch_descs(vq);
> > > > +            ret = fetch_buf(vq))
> > > > +               ;
> > >
> > > (Expanding comment in V6):
> > >
> > > We get an infinite loop this way:
> > > * vq->ndescs == 0, so we call fetch_buf() here
> > > * fetch_buf gets less than vhost_vq_num_batch_descs(vq); descriptors. ret = 1
> > > * This loop calls again fetch_buf, but vq->ndescs > 0 (and avail_vq ==
> > > last_avail_vq), so it just return 1
> >
> > That's what
> >          [PATCH RFC v7 08/14] fixup! vhost: use batched get_vq_desc version
> > is supposed to fix.
> >
> 
> Sorry, I forgot to include that fixup.
> 
> With it I don't see CPU stalls, but with that version latency has
> increased a lot and I see packet lost:
> + ping -c 5 10.200.0.1
> PING 10.200.0.1 (10.200.0.1) 56(84) bytes of data.
> >From 10.200.0.2 icmp_seq=1 Destination Host Unreachable
> >From 10.200.0.2 icmp_seq=2 Destination Host Unreachable
> >From 10.200.0.2 icmp_seq=3 Destination Host Unreachable
> 64 bytes from 10.200.0.1: icmp_seq=5 ttl=64 time=6848 ms
> 
> --- 10.200.0.1 ping statistics ---
> 5 packets transmitted, 1 received, +3 errors, 80% packet loss, time 76ms
> rtt min/avg/max/mdev = 6848.316/6848.316/6848.316/0.000 ms, pipe 4
> --
> 
> I cannot even use netperf.

OK so that's the bug to try to find and fix I think.


> If I modify with my proposed version:
> + ping -c 5 10.200.0.1
> PING 10.200.0.1 (10.200.0.1) 56(84) bytes of data.
> 64 bytes from 10.200.0.1: icmp_seq=1 ttl=64 time=7.07 ms
> 64 bytes from 10.200.0.1: icmp_seq=2 ttl=64 time=0.358 ms
> 64 bytes from 10.200.0.1: icmp_seq=3 ttl=64 time=5.35 ms
> 64 bytes from 10.200.0.1: icmp_seq=4 ttl=64 time=2.27 ms
> 64 bytes from 10.200.0.1: icmp_seq=5 ttl=64 time=0.426 ms


Not sure which version this is.

> [root@localhost ~]# netperf -H 10.200.0.1 -p 12865 -l 10 -t TCP_STREAM
> MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
> 10.200.0.1 () port 0 AF_INET
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
> 
> 131072  16384  16384    10.01    4742.36
> [root@localhost ~]# netperf -H 10.200.0.1 -p 12865 -l 10 -t UDP_STREAM
> MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
> 10.200.0.1 () port 0 AF_INET
> Socket  Message  Elapsed      Messages
> Size    Size     Time         Okay Errors   Throughput
> bytes   bytes    secs            #      #   10^6bits/sec
> 
> 212992   65507   10.00        9214      0     482.83
> 212992           10.00        9214            482.83
> 
> I will compare with the non-batch version for reference, but the
> difference between the two is noticeable. Maybe it's worth finding a
> good value for the if() inside fetch_buf?
> 
> Thanks!
> 

I don't think it's performance, I think it's a bug somewhere,
e.g. maybe we corrupt a packet, or stall the queue, or
something like this.

Let's do this, I will squash the fixups and post v8 so you can bisect
and then debug cleanly.

> > --
> > MST
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
