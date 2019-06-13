Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 042ED43309
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 09:00:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4011CCD1;
	Thu, 13 Jun 2019 07:00:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B43FCC6A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 07:00:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 40DAC84C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 07:00:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1273B2DD4;
	Thu, 13 Jun 2019 07:00:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
	[10.36.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6553360C8B;
	Thu, 13 Jun 2019 07:00:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8253211AB8; Thu, 13 Jun 2019 09:00:16 +0200 (CEST)
Date: Thu, 13 Jun 2019 09:00:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 12/13] drm/virtio: drop DRM_AUTH usage from the driver
Message-ID: <20190613070016.sllkspqodporxtvp@sirius.home.kraxel.org>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
	<20190527081741.14235-12-emil.l.velikov@gmail.com>
	<CACvgo51+WknrTjzEhc6EitJV5EA0f9SXznQMkw3Y_ixPHSOLPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51+WknrTjzEhc6EitJV5EA0f9SXznQMkw3Y_ixPHSOLPQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 13 Jun 2019 07:00:17 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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

On Thu, Jun 06, 2019 at 11:59:15AM +0100, Emil Velikov wrote:
> On Mon, 27 May 2019 at 09:19, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > The authentication can be circumvented, by design, by using the render
> > node.
> >
> > From the driver POV there is no distinction between primary and render
> > nodes, thus we can drop the token.
> >
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: virtualization@lists.linux-foundation.org
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
