Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE4514399B
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 10:36:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 08F8684794;
	Tue, 21 Jan 2020 09:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HygiFCuUan+v; Tue, 21 Jan 2020 09:36:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1805B815D7;
	Tue, 21 Jan 2020 09:36:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6057C0174;
	Tue, 21 Jan 2020 09:36:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D43BC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 45A2985C45
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfZPxCrAJ31Y
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E177185BF7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579599371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdRYDJy3zXKhhdSk+IvlR6XBSRBN3vxA9xzwEA+x+m0=;
 b=fd0P02S2hMv/rcx++ImXnmfHdWi2Dmqgt4a4+IrQrkOeUGGmeeLBPvawGwrtLjYDhzYjq3
 R36LBLukKiNElEDvVF+XkFOCl/hrTn8iYfmrDqSrTytrqsTd+PYWDVDoNdehG4eMqdbJUZ
 0i0DEY8wsZRB86a6esMqN+6iw5hohPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-WGhMKxUGM8qMmG1iPee1dQ-1; Tue, 21 Jan 2020 04:36:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98598108442D;
 Tue, 21 Jan 2020 09:36:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68F515C545;
 Tue, 21 Jan 2020 09:36:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8E5D416E36; Tue, 21 Jan 2020 10:36:04 +0100 (CET)
Date: Tue, 21 Jan 2020 10:36:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/4] Use no_vblank property for drivers without VBLANK
Message-ID: <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
References: <20200120122051.25178-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200120122051.25178-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: WGhMKxUGM8qMmG1iPee1dQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 noralf@tronnes.org, laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 xen-devel@lists.xenproject.org, sean@poorly.run, emil.velikov@collabora.com
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

On Mon, Jan 20, 2020 at 01:20:47PM +0100, Thomas Zimmermann wrote:
> Instead of faking VBLANK events by themselves, drivers without VBLANK
> support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
> The patchset makes this official and converts over drivers.
> 
> The current implementation looks at the number of initialized CRTCs
> wrt vblanking. If vblanking has been initialized for a CRTC, the driver
> is responsible for sending out VBLANK events. Otherwise, DRM will send
> out the event. The behaviour selected by initializing no_vblank as part
> of drm_atomic_helper_check_modeset().
> 
> I went through all drivers, looking for those that call send out VBLANK
> events but do not call drm_vblank_init(). These are converted to the new
> semantics. This affects tiny drivers; drivers for virtual hardware; and
> a few others, which do not support interrupts. Xen comes with its
> own VBLANK logic and disables no_vblank explictly.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
