Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 86465598C2
	for <lists.virtualization@lfdr.de>; Fri, 28 Jun 2019 12:49:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6DBF1C7F;
	Fri, 28 Jun 2019 10:49:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 72C76B8F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 28 Jun 2019 10:49:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3E28F13A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 28 Jun 2019 10:49:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1069A30BBEA6;
	Fri, 28 Jun 2019 10:49:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
	[10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B44EE1001B1B;
	Fri, 28 Jun 2019 10:49:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id EB20D11AA3; Fri, 28 Jun 2019 12:49:07 +0200 (CEST)
Date: Fri, 28 Jun 2019 12:49:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v4 11/12] drm/virtio: switch from ttm to gem shmem helpers
Message-ID: <20190628104907.vign7lmgftrwfisv@sirius.home.kraxel.org>
References: <20190620060726.926-1-kraxel@redhat.com>
	<20190620060726.926-12-kraxel@redhat.com>
	<CAPaKu7QXCMMKR50Oiv=CefUA4S+S3KgpJ2FKTd1WA1H2_ORqXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7QXCMMKR50Oiv=CefUA4S+S3KgpJ2FKTd1WA1H2_ORqXg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 28 Jun 2019 10:49:15 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

> >  static inline struct virtio_gpu_object*
> >  virtio_gpu_object_ref(struct virtio_gpu_object *bo)

> The last users of these two helpers are removed with this patch.  We
> can remove them.

patch 12/12 does that.

> > +       bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
> > +       bo->base.base.funcs = &virtio_gpu_gem_funcs;
> Move this to virtio_gpu_create_object.

Fixed.

> > +       ret = drm_gem_shmem_pin(&obj->base.base);
> The bo is attached for its entire lifetime, at least currently.  Maybe
> we can use drm_gem_shmem_get_pages_sgt (and get rid of obj->pages).

Already checked this.
We can't due to the iommu quirks.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
