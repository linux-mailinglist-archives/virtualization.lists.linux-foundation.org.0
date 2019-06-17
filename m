Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B18479D6
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 08:03:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 23CD0C77;
	Mon, 17 Jun 2019 06:03:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DA0F0C6D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 06:03:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8B6522C3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 06:03:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A9F5356CA;
	Mon, 17 Jun 2019 06:03:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
	[10.36.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDA07BE65;
	Mon, 17 Jun 2019 06:03:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6AD3116E18; Mon, 17 Jun 2019 08:03:21 +0200 (CEST)
Date: Mon, 17 Jun 2019 08:03:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 37/59] drm/virtio: Drop drm_gem_prime_export/import
Message-ID: <20190617060321.pbuqy5adup2ypti2@sirius.home.kraxel.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
	<20190614203615.12639-38-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-38-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 17 Jun 2019 06:03:22 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org
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

On Fri, Jun 14, 2019 at 10:35:53PM +0200, Daniel Vetter wrote:
> They're the default.
> 
> Aside: Would be really nice to switch the others over to
> drm_gem_object_funcs.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
