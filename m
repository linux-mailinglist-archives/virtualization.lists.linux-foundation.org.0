Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0CB1FC16E
	for <lists.virtualization@lfdr.de>; Wed, 17 Jun 2020 00:08:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33B40895CE;
	Tue, 16 Jun 2020 22:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ub-OCSByD9cu; Tue, 16 Jun 2020 22:08:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 28FA9895DB;
	Tue, 16 Jun 2020 22:08:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2921C0892;
	Tue, 16 Jun 2020 22:08:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FA29C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 22:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 39002895DD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 22:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbVylNoQ+0Lw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 22:08:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 08167895DB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 22:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592345291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqnwXZa+UN6gwaHjQEjRbgzON38XVRW1NuyX+FToqwI=;
 b=DlVfvF4vwSSMHP9dEKiWHnkA45P7VHjbMGcVDWtFJphvS379kUgS1LtneWghNo4NlOuQF/
 V/62/9Erds0lRByg6ZaLRdGCf7rcg+4wccgBIu6hZxWrFziMR/hl1oDNb3/l/54RhkaXIW
 l4ha6tpJpkFy+gHFZC1lNGph5f9CN1M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-Fb07Oc6eMPmcn-lopueP0A-1; Tue, 16 Jun 2020 18:08:10 -0400
X-MC-Unique: Fb07Oc6eMPmcn-lopueP0A-1
Received: by mail-wr1-f69.google.com with SMTP id e1so67859wrm.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7CP01C0W+UxRSj8yLj//dWMR0NvRbCdUzzXI0Pchkjc=;
 b=t1TyJ17vtetMlP7Gs19Cd93tMmuDSZeP7VPyA1Az1PIkXqtAzB2iKZqNDQKyGMBRIa
 wJsRT/oPmCUmNLG6xPLDFrHqrX3WXgLcS4YGSW7sUxkQMHI1lH82/yKveiEACwvWyk/G
 vrUoEO0S9J6rHcy2kAAmWqf2M9GgdHpOOZaMV8IQrEuHpViJ72zqte8m9BwXQ0tRYt5E
 pIlW0vyBWZ153UjT+642YLc8GyvajEeNipDwwK/hcsJxkgg0Edd3o8c2frCSLUF86Ve+
 9u6yZjxknp7OnTZvXGfs1x85cgm706G3mPlJTHeqW+6S/A75QWqso2tLU8o2BG6HzM9o
 W4Hg==
X-Gm-Message-State: AOAM533+WionmcuVug2zNnNFAfA23ELqCdqRdLFcERh7+iSexQucIlBU
 Pf0vCaoYzdlBTbqUMVHzTg1CxjJvQTMKf94cSjzLnvW0mVAkQvfz1UoaBTHSpwUyvdUXQG29ZcP
 9oSK1SOQmWEv48aJIYJX/bpEVwjq90ijk4cCyj9+S3w==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr4964190wrq.242.1592345288553; 
 Tue, 16 Jun 2020 15:08:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+YwKGiCPOYkO3s9mtutwnCfxVpYD54lMU6VgHDv3qQP0i01djJPcPzyqmByuEL0gGp486jg==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr4964176wrq.242.1592345288283; 
 Tue, 16 Jun 2020 15:08:08 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id n204sm6055762wma.5.2020.06.16.15.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 15:08:07 -0700 (PDT)
Date: Tue, 16 Jun 2020 18:08:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v7 03/14] vhost: use batched get_vq_desc version
Message-ID: <20200616180136-mutt-send-email-mst@kernel.org>
References: <20200610113515.1497099-1-mst@redhat.com>
 <20200610113515.1497099-4-mst@redhat.com>
 <CAJaqyWdGKh5gSTndGuVPyJSgt3jfjfW4xNCrJ2tQ9f+mD8=sMQ@mail.gmail.com>
 <20200610111147-mutt-send-email-mst@kernel.org>
 <CAJaqyWe6d19hFAbpqaQqOPuQQmBQyevyF4sTVkaXKhD729XDkw@mail.gmail.com>
 <20200611072702-mutt-send-email-mst@kernel.org>
 <26bef3f07277b028034c019e456b4f236078c5fb.camel@redhat.com>
 <CAJaqyWeX7knekVPcsZ2+AAf8zvZhPvt46fZncAsLhwYJ3eUa1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWeX7knekVPcsZ2+AAf8zvZhPvt46fZncAsLhwYJ3eUa1g@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Jun 16, 2020 at 05:23:43PM +0200, Eugenio Perez Martin wrote:
> On Mon, Jun 15, 2020 at 6:05 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > On Thu, 2020-06-11 at 07:30 -0400, Michael S. Tsirkin wrote:
> > > On Wed, Jun 10, 2020 at 06:18:32PM +0200, Eugenio Perez Martin wrote:
> > > > On Wed, Jun 10, 2020 at 5:13 PM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
> > > > > On Wed, Jun 10, 2020 at 02:37:50PM +0200, Eugenio Perez Martin wr=
ote:
> > > > > > > +/* This function returns a value > 0 if a descriptor was fou=
nd, or 0 if none were found.
> > > > > > > + * A negative code is returned on error. */
> > > > > > > +static int fetch_descs(struct vhost_virtqueue *vq)
> > > > > > > +{
> > > > > > > +       int ret;
> > > > > > > +
> > > > > > > +       if (unlikely(vq->first_desc >=3D vq->ndescs)) {
> > > > > > > +               vq->first_desc =3D 0;
> > > > > > > +               vq->ndescs =3D 0;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       if (vq->ndescs)
> > > > > > > +               return 1;
> > > > > > > +
> > > > > > > +       for (ret =3D 1;
> > > > > > > +            ret > 0 && vq->ndescs <=3D vhost_vq_num_batch_de=
scs(vq);
> > > > > > > +            ret =3D fetch_buf(vq))
> > > > > > > +               ;
> > > > > >
> > > > > > (Expanding comment in V6):
> > > > > >
> > > > > > We get an infinite loop this way:
> > > > > > * vq->ndescs =3D=3D 0, so we call fetch_buf() here
> > > > > > * fetch_buf gets less than vhost_vq_num_batch_descs(vq); descri=
ptors. ret =3D 1
> > > > > > * This loop calls again fetch_buf, but vq->ndescs > 0 (and avai=
l_vq =3D=3D
> > > > > > last_avail_vq), so it just return 1
> > > > >
> > > > > That's what
> > > > >          [PATCH RFC v7 08/14] fixup! vhost: use batched get_vq_de=
sc version
> > > > > is supposed to fix.
> > > > >
> > > >
> > > > Sorry, I forgot to include that fixup.
> > > >
> > > > With it I don't see CPU stalls, but with that version latency has
> > > > increased a lot and I see packet lost:
> > > > + ping -c 5 10.200.0.1
> > > > PING 10.200.0.1 (10.200.0.1) 56(84) bytes of data.
> > > > > From 10.200.0.2 icmp_seq=3D1 Destination Host Unreachable
> > > > > From 10.200.0.2 icmp_seq=3D2 Destination Host Unreachable
> > > > > From 10.200.0.2 icmp_seq=3D3 Destination Host Unreachable
> > > > 64 bytes from 10.200.0.1: icmp_seq=3D5 ttl=3D64 time=3D6848 ms
> > > >
> > > > --- 10.200.0.1 ping statistics ---
> > > > 5 packets transmitted, 1 received, +3 errors, 80% packet loss, time=
 76ms
> > > > rtt min/avg/max/mdev =3D 6848.316/6848.316/6848.316/0.000 ms, pipe 4
> > > > --
> > > >
> > > > I cannot even use netperf.
> > >
> > > OK so that's the bug to try to find and fix I think.
> > >
> > >
> > > > If I modify with my proposed version:
> > > > + ping -c 5 10.200.0.1
> > > > PING 10.200.0.1 (10.200.0.1) 56(84) bytes of data.
> > > > 64 bytes from 10.200.0.1: icmp_seq=3D1 ttl=3D64 time=3D7.07 ms
> > > > 64 bytes from 10.200.0.1: icmp_seq=3D2 ttl=3D64 time=3D0.358 ms
> > > > 64 bytes from 10.200.0.1: icmp_seq=3D3 ttl=3D64 time=3D5.35 ms
> > > > 64 bytes from 10.200.0.1: icmp_seq=3D4 ttl=3D64 time=3D2.27 ms
> > > > 64 bytes from 10.200.0.1: icmp_seq=3D5 ttl=3D64 time=3D0.426 ms
> > >
> > > Not sure which version this is.
> > >
> > > > [root@localhost ~]# netperf -H 10.200.0.1 -p 12865 -l 10 -t TCP_STR=
EAM
> > > > MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
> > > > 10.200.0.1 () port 0 AF_INET
> > > > Recv   Send    Send
> > > > Socket Socket  Message  Elapsed
> > > > Size   Size    Size     Time     Throughput
> > > > bytes  bytes   bytes    secs.    10^6bits/sec
> > > >
> > > > 131072  16384  16384    10.01    4742.36
> > > > [root@localhost ~]# netperf -H 10.200.0.1 -p 12865 -l 10 -t UDP_STR=
EAM
> > > > MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
> > > > 10.200.0.1 () port 0 AF_INET
> > > > Socket  Message  Elapsed      Messages
> > > > Size    Size     Time         Okay Errors   Throughput
> > > > bytes   bytes    secs            #      #   10^6bits/sec
> > > >
> > > > 212992   65507   10.00        9214      0     482.83
> > > > 212992           10.00        9214            482.83
> > > >
> > > > I will compare with the non-batch version for reference, but the
> > > > difference between the two is noticeable. Maybe it's worth finding a
> > > > good value for the if() inside fetch_buf?
> > > >
> > > > Thanks!
> > > >
> > >
> > > I don't think it's performance, I think it's a bug somewhere,
> > > e.g. maybe we corrupt a packet, or stall the queue, or
> > > something like this.
> > >
> > > Let's do this, I will squash the fixups and post v8 so you can bisect
> > > and then debug cleanly.
> >
> > Ok, so if we apply the patch proposed in v7 08/14 (Or the version 8 of =
the patchset sent), this is what happens:
> >
> > 1. Userland (virtio_test in my case) introduces just one buffer in vq, =
and it kicks
> > 2. vhost module reaches fetch_descs, called from vhost_get_vq_desc. Fro=
m there we call fetch_buf in a for loop.
> > 3. The first time we call fetch_buf, it returns properly one buffer. Ho=
wever, the second time we call it, it returns 0
> > because vq->avail_idx =3D=3D vq->last_avail_idx and vq->avail_idx =3D=
=3D last_avail_idx code path.
> > 4. fetch_descs assign ret =3D 0, so it returns 0. vhost_get_vq_desc wil=
l goto err, and it will signal no new buffer
> > (returning vq->num).
> >
> > So to fix it and maintain the batching maybe we could return vq->ndescs=
 in case ret =3D=3D 0:
> >
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index c0dfb5e3d2af..5993d4f34ca9 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -2315,7 +2327,8 @@ static int fetch_descs(struct vhost_virtqueue *vq)
> >
> >         /* On success we expect some descs */
> >         BUG_ON(ret > 0 && !vq->ndescs);
> > -       return ret;
> > +       return ret ?: vq->ndescs;


I'd rather we used standard C. Also ret < 0 needs
to be handled. Also - what if fetch of some descs fails
but some succeeds?
What do we want to do?
Maybe:

return vq->ndescs ? vq->ndescs : ret;


> >  }
> >
> >  /* Reverse the effects of fetch_descs */
> > --
> >
> > Another possibility could be to return different codes from fetch_buf, =
but I find the suggested modification easier.
> >
> > What do you think?
> >
> > Thanks!
> >
> =

> Hi!
> =

> I can send a proposed RFC v9 in case it is more convenient for you.
> =

> Thanks!

Excellent, pls go ahead!
And can you include the performance numbers?
It's enough to test the final version.

-- =

MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
