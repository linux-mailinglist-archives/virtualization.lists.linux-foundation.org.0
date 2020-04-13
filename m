Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD41A6873
	for <lists.virtualization@lfdr.de>; Mon, 13 Apr 2020 17:04:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3764583B47;
	Mon, 13 Apr 2020 15:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLSO5QOenJ67; Mon, 13 Apr 2020 15:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 21B3084FC0;
	Mon, 13 Apr 2020 15:04:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEB7FC0172;
	Mon, 13 Apr 2020 15:04:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AFDAC0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 15:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 59A3384693
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 15:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhu6Ga7hO8zK
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 15:04:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 54B8B84155
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 15:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586790258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zc6+nWT++Ml3QDe/48B3vyBdhm6qK+le1jv8iA34Hag=;
 b=a2WWm/6Y20k+N+ic81vDjxROTg7DkWkI/FGzyfoo1WWKDp31KI9LXHbsECmejrrKw4hA5N
 MJGin07nr5zZlCOP5gp773+1mcg19VVQjTu3B9jxLD3DxUxWEUSdrAImvksnyxWVX8x82d
 w1J7EKoFr6ufhGoPRiC1/P/uUrJwCNQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-2NxkN4OMOS6UCyXrrpCAOQ-1; Mon, 13 Apr 2020 11:04:16 -0400
X-MC-Unique: 2NxkN4OMOS6UCyXrrpCAOQ-1
Received: by mail-wm1-f69.google.com with SMTP id o5so2774602wmo.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 08:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=17t47p62WxVqQ3k2XMIaH3GAgbSI+gMIhNKLJVLPfOE=;
 b=k4q5IzTZ2ksSdSZpgKjMrfqERzJkvEt86ipBomy6BmA81Y1cFZjfQWlbez5TtQ+1a9
 YlsDy1jjlAV3qNn1K0IKw3j4jTNnMLdU1coQ1ZcWg87Gvq3+p7rMFKPPiv+mJluixeCN
 tZ+G/df8jSMgQ2FRor7boajdNgMe6PA7Au9kL3VnEkSgIb3YrQd6lEby+rGUvN+9oTvI
 sP0ymYkZjliBO/sLE5e/tLCt1dfdiOB4FwvEmSFWkCx/irfYVHX3oqlOGYJFELmPG7Or
 9AnJmQu3E/K9vKLEzMmQrpaTvtIe5wRzBly/wdiHKIgOoJw/W+Ne5Ftf/o9Wgir35Y36
 Juog==
X-Gm-Message-State: AGi0PuacvR0SFQ9jJUDPxIagql5oS2DmMZ05U4z6ZnWMeu85zKqqiG6s
 2rwkCLnLqjI2+aZ3P84Zw9KHMmTT4BU4oCNPeYpbkHi1383QfMCGOwEfTVWlTK2gNdj7KLN5w7B
 /njDGihEG67W2KCYxTj4noQafe1bFKJfDUxItMy8VyQ==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr18217358wrr.131.1586790255100; 
 Mon, 13 Apr 2020 08:04:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypLb8EpzCSSDu1/k+4HxGtBRat97HSOUEfq2h0YXRdsfzcIOhO5iu2JTbNNJB4PYUfr8gNiRUg==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr18217333wrr.131.1586790254791; 
 Mon, 13 Apr 2020 08:04:14 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id o11sm14764690wme.13.2020.04.13.08.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 08:04:14 -0700 (PDT)
Date: Mon, 13 Apr 2020 11:04:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 0/8] tools/vhost: Reset virtqueue on tests
Message-ID: <20200413110403-mutt-send-email-mst@kernel.org>
References: <20200403165119.5030-1-eperezma@redhat.com>
 <20200413071044-mutt-send-email-mst@kernel.org>
 <CAJaqyWcOmzxfOodudSjrZa1SeYDZKiO3MFMy_w44cL_eaBhYDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcOmzxfOodudSjrZa1SeYDZKiO3MFMy_w44cL_eaBhYDA@mail.gmail.com>
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

On Mon, Apr 13, 2020 at 04:50:06PM +0200, Eugenio Perez Martin wrote:
> On Mon, Apr 13, 2020 at 1:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Apr 03, 2020 at 06:51:11PM +0200, Eugenio P=C3=A9rez wrote:
> > > This series add the tests used to validate the "vhost: Reset batched
> > > descriptors on SET_VRING_BASE call" series, with a small change on the
> > > reset code (delete an extra unneded reset on VHOST_SET_VRING_BASE).
> > >
> > > They are based on the tests sent back them, the ones that were not
> > > included (reasons in that thread). This series changes:
> > >
> > > * Delete need to export the ugly function in virtio_ring, now all the
> > > code is added in tools/virtio (except the one line fix).
> > > * Add forgotten uses of vhost_vq_set_backend. Fix bad usage order in
> > > vhost_test_set_backend.
> > > * Drop random reset, not really needed.
> > > * Minor changes updating tests code.
> > >
> > > This serie is meant to be applied on top of
> > > 5de4e0b7068337cf0d4ca48a4011746410115aae in
> > > git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git.
> >
> > Is this still needed?
> =

> ("tools/virtio: fix virtio_test.c") indentation is actually cosmetic.
> ("vhost: Not cleaning batched descs in VHOST_SET_VRING_BASE ioctl")
> just avoid to clean batches descriptors for a third time (they are
> cleaned on backend removal and addition).
> =

> ("vhost: Fix bad order in vhost_test_set_backend at enable") is
> actually a fix, the test does not work properly without it. And
> ("tools/virtio: Reset index in virtio_test --reset.") Makes the test
> work more similar than the actual VM does in a reset.
> =

> ("tools/virtio: Use __vring_new_virtqueue in virtio_test.c") and
> ("tools/virtio: Extract virtqueue initialization in vq_reset") are
> convenience commits to reach the previous two.
> =

> Lastly, ("tools/virtio: Use tools/include/list.h instead of stubs")
> just removes stub code, I did it when I try to test vdpa code and it
> seems to me a nice to have, but we can drop it from the patchset if
> you don't see that way.
> =

> > The patches lack Signed-off-by and
> > commit log descriptions, reference commit Ids without subject.
> > See Documentation/process/submitting-patches.rst
> >
> =

> Sorry, I will try to keep an eye on that from now on. I will send a v2
> with Signed-off-by and extended descriptions if you see it ok.
> =

> Thanks!

Sure, pls go ahead.

> > > Eugenio P=C3=A9rez (8):
> > >   tools/virtio: fix virtio_test.c indentation
> > >   vhost: Not cleaning batched descs in VHOST_SET_VRING_BASE ioctl
> > >   vhost: Replace vq->private_data access by backend accesors
> > >   vhost: Fix bad order in vhost_test_set_backend at enable
> > >   tools/virtio: Use __vring_new_virtqueue in virtio_test.c
> > >   tools/virtio: Extract virtqueue initialization in vq_reset
> > >   tools/virtio: Reset index in virtio_test --reset.
> > >   tools/virtio: Use tools/include/list.h instead of stubs
> > >
> > >  drivers/vhost/test.c        |  8 ++---
> > >  drivers/vhost/vhost.c       |  1 -
> > >  tools/virtio/linux/kernel.h |  7 +----
> > >  tools/virtio/linux/virtio.h |  5 ++--
> > >  tools/virtio/virtio_test.c  | 58 +++++++++++++++++++++++++++--------=
--
> > >  tools/virtio/vringh_test.c  |  2 ++
> > >  6 files changed, 51 insertions(+), 30 deletions(-)
> > >
> > > --
> > > 2.18.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
