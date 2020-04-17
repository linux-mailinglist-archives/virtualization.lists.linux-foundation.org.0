Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E251AD884
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 10:29:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6F12834E6;
	Fri, 17 Apr 2020 08:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SM5sft1NLgV; Fri, 17 Apr 2020 08:28:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9031F83138;
	Fri, 17 Apr 2020 08:28:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 605F8C0172;
	Fri, 17 Apr 2020 08:28:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27968C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 115C38453D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4IWwrLcwZa-D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:28:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D3F784536
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587112134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oasdo/n58yfP5QePlXQxCoOhZ1IeYWDPi9VJ2pRbqoY=;
 b=DptQs9ET/TJKWLNt5Qc7WBQlOUXGxM+uR4c1DrRhLW+v3B8E6nhwhvN6Utf2vijvfv7fnU
 w210teKsdI1nz3obg2WVraoDRyShbioWrCCTfx4lFCy3sebLO4pscg4lrmmMJvYwumnHBA
 aLgb/ZJZeZvAAxxH86usKBo1NrDu1r0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-xQcjkeeQMBSss3qlUmd-CQ-1; Fri, 17 Apr 2020 04:28:51 -0400
X-MC-Unique: xQcjkeeQMBSss3qlUmd-CQ-1
Received: by mail-wr1-f69.google.com with SMTP id q10so630331wrv.10
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 01:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mJ8xriwhJnwxVRszo7sZYDjt+bqPl2dFP/ChGE8P0zA=;
 b=ChxMTNTT/xvjUU8S6x8nAZZX8uC4yLcu4PhEEAtx6D8bKsnnADbpyQpBc9DY7Kahx1
 QZp2C3erQVw2bmSm3gOCxgwdhFJmE19kl7D3C46MMfawWryQWIENJvD52RZSLVIxYall
 4q5OS5ywUSwRJdibMj6wgArGeBSWu69R4Y4X2tE4CRA8BfiHTanu81pUVOj5PlmnMsKD
 aPBOx3lE7L7P48OzwfzmN7EtAzX54E86Sw8eYTjCFVaDumPYScWfKEVOLFgE9oFcVANF
 mNrY+KIIn92SBo/HvktrI/ASoGP5SVCsBqBoofvmW/9Mi2627pF777RsmZysUkBRkxVs
 Fe7g==
X-Gm-Message-State: AGi0Pua71bmke8CGKrxcIuBFjw+FMSEG5gnrC0QXHdmaA9pZFWMn7FPM
 nMKt+qqyp4m+c8XiZLQVmlAlAoLU2XQS41NyF03gfSS2mp/38bDv8cl7wHGDElIIt2mz4ylE5Yz
 RJP3djk3vYDvkuLamsYTLYhWSkANcGgl3uZytW79C0g==
X-Received: by 2002:a05:600c:2c04:: with SMTP id
 q4mr2078498wmg.7.1587112130080; 
 Fri, 17 Apr 2020 01:28:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2Sn7FUvpE07r59sGuE5XHGLLO0BakznVfq9gjnT4uADElM12aSKCTNB609s6nmfxAJ2jCoQ==
X-Received: by 2002:a05:600c:2c04:: with SMTP id
 q4mr2078477wmg.7.1587112129750; 
 Fri, 17 Apr 2020 01:28:49 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id u7sm7319215wmg.41.2020.04.17.01.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 01:28:49 -0700 (PDT)
Date: Fri, 17 Apr 2020 04:28:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH v2 7/8] tools/virtio: Reset index in virtio_test --reset.
Message-ID: <20200417042551-mutt-send-email-mst@kernel.org>
References: <20200416075643.27330-1-eperezma@redhat.com>
 <20200416075643.27330-8-eperezma@redhat.com>
 <20200416183324-mutt-send-email-mst@kernel.org>
 <CAJaqyWcBTnXvkzaqfSOWODK=+jddeVpee-4ZuqfWc+zj0UsZLA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcBTnXvkzaqfSOWODK=+jddeVpee-4ZuqfWc+zj0UsZLA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Fri, Apr 17, 2020 at 09:04:04AM +0200, Eugenio Perez Martin wrote:
> On Fri, Apr 17, 2020 at 12:34 AM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> >
> > On Thu, Apr 16, 2020 at 09:56:42AM +0200, Eugenio P=C3=A9rez wrote:
> > > This way behavior for vhost is more like a VM.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > I dropped --reset from 5.7 since Linus felt it's unappropriate.
> > I guess I should squash this in with --reset?
> >
> =

> Yes please.
> =

> If you prefer I can do it using the base you want, so all commits
> messages are right.
> =

> Thanks!

OK so I dropped new tests from vhost for now, pls rebased on
top of that.

Thanks!

> > > ---
> > >  tools/virtio/virtio_test.c | 33 ++++++++++++++++++++++++++-------
> > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> > > index 18d5347003eb..dca64d36a882 100644
> > > --- a/tools/virtio/virtio_test.c
> > > +++ b/tools/virtio/virtio_test.c
> > > @@ -20,7 +20,6 @@
> > >  #include "../../drivers/vhost/test.h"
> > >
> > >  #define RANDOM_BATCH -1
> > > -#define RANDOM_RESET -1
> > >
> > >  /* Unused */
> > >  void *__kmalloc_fake, *__kfree_ignore_start, *__kfree_ignore_end;
> > > @@ -49,6 +48,7 @@ struct vdev_info {
> > >
> > >  static const struct vhost_vring_file no_backend =3D { .fd =3D -1 },
> > >                                    backend =3D { .fd =3D 1 };
> > > +static const struct vhost_vring_state null_state =3D {};
> > >
> > >  bool vq_notify(struct virtqueue *vq)
> > >  {
> > > @@ -174,14 +174,19 @@ static void run_test(struct vdev_info *dev, str=
uct vq_info *vq,
> > >       unsigned len;
> > >       long long spurious =3D 0;
> > >       const bool random_batch =3D batch =3D=3D RANDOM_BATCH;
> > > +
> > >       r =3D ioctl(dev->control, VHOST_TEST_RUN, &test);
> > >       assert(r >=3D 0);
> > > +     if (!reset_n) {
> > > +             next_reset =3D INT_MAX;
> > > +     }
> > > +
> > >       for (;;) {
> > >               virtqueue_disable_cb(vq->vq);
> > >               completed_before =3D completed;
> > >               started_before =3D started;
> > >               do {
> > > -                     const bool reset =3D reset_n && completed > nex=
t_reset;
> > > +                     const bool reset =3D completed > next_reset;
> > >                       if (random_batch)
> > >                               batch =3D (random() % vq->vring.num) + =
1;
> > >
> > > @@ -224,10 +229,24 @@ static void run_test(struct vdev_info *dev, str=
uct vq_info *vq,
> > >                       }
> > >
> > >                       if (reset) {
> > > +                             struct vhost_vring_state s =3D { .index=
 =3D 0 };
> > > +
> > > +                             vq_reset(vq, vq->vring.num, &dev->vdev);
> > > +
> > > +                             r =3D ioctl(dev->control, VHOST_GET_VRI=
NG_BASE,
> > > +                                       &s);
> > > +                             assert(!r);
> > > +
> > > +                             s.num =3D 0;
> > > +                             r =3D ioctl(dev->control, VHOST_SET_VRI=
NG_BASE,
> > > +                                       &null_state);
> > > +                             assert(!r);
> > > +
> > >                               r =3D ioctl(dev->control, VHOST_TEST_SE=
T_BACKEND,
> > >                                         &backend);
> > >                               assert(!r);
> > >
> > > +                             started =3D completed;
> > >                               while (completed > next_reset)
> > >                                       next_reset +=3D completed;
> > >                       }
> > > @@ -249,7 +268,9 @@ static void run_test(struct vdev_info *dev, struc=
t vq_info *vq,
> > >       test =3D 0;
> > >       r =3D ioctl(dev->control, VHOST_TEST_RUN, &test);
> > >       assert(r >=3D 0);
> > > -     fprintf(stderr, "spurious wakeups: 0x%llx\n", spurious);
> > > +     fprintf(stderr,
> > > +             "spurious wakeups: 0x%llx started=3D0x%lx completed=3D0=
x%lx\n",
> > > +             spurious, started, completed);
> > >  }
> > >
> > >  const char optstring[] =3D "h";
> > > @@ -312,7 +333,7 @@ static void help(void)
> > >               " [--no-virtio-1]"
> > >               " [--delayed-interrupt]"
> > >               " [--batch=3Drandom/N]"
> > > -             " [--reset=3Drandom/N]"
> > > +             " [--reset=3DN]"
> > >               "\n");
> > >  }
> > >
> > > @@ -360,11 +381,9 @@ int main(int argc, char **argv)
> > >               case 'r':
> > >                       if (!optarg) {
> > >                               reset =3D 1;
> > > -                     } else if (0 =3D=3D strcmp(optarg, "random")) {
> > > -                             reset =3D RANDOM_RESET;
> > >                       } else {
> > >                               reset =3D strtol(optarg, NULL, 10);
> > > -                             assert(reset >=3D 0);
> > > +                             assert(reset > 0);
> > >                               assert(reset < (long)INT_MAX + 1);
> > >                       }
> > >                       break;
> > > --
> > > 2.18.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
