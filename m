Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0734C5658B
	for <lists.virtualization@lfdr.de>; Wed, 26 Jun 2019 11:15:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ACB7BE67;
	Wed, 26 Jun 2019 09:15:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 93F1CDD8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 09:15:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3F6C0831
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 09:15:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9111730811C7;
	Wed, 26 Jun 2019 09:15:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
	[10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04FF55C1A1;
	Wed, 26 Jun 2019 09:15:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1C01316E18; Wed, 26 Jun 2019 11:15:31 +0200 (CEST)
Date: Wed, 26 Jun 2019 11:15:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] drm/virtio: move drm_connector_update_edid_property() call
Message-ID: <20190626091531.35da5c2dsz6fuz5w@sirius.home.kraxel.org>
References: <20190405044602.2334-1-kraxel@redhat.com>
	<20190626095146.2731a2dc.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626095146.2731a2dc.cohuck@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 26 Jun 2019 09:15:34 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, "open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, jcmvbkbc@gmail.com,
	Daniel Vetter <daniel@ffwll.ch>
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

On Wed, Jun 26, 2019 at 09:51:46AM +0200, Cornelia Huck wrote:
> On Fri,  5 Apr 2019 06:46:02 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > drm_connector_update_edid_property can sleep, we must not
> > call it while holding a spinlock.  Move the callsize.
> 
> s/callsize/callsite/

Fixed on commit.

> This gets rid of the sleeping while atomic traces I've been seeing with
> an s390x guest (both virtio-gpu-pci and virtio-gpu-ccw).
> 
> Tested-by: Cornelia Huck <cohuck@redhat.com>
> 
> I have also looked at the code a bit, but don't feel confident enough
> to give an R-b.
> 
> Acked-by: Cornelia Huck <cohuck@redhat.com>

Thanks.  Pushed to drm-misc-fixes.

cheers,
  Gerd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
