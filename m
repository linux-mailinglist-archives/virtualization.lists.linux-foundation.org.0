Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1C3B2B85
	for <lists.virtualization@lfdr.de>; Thu, 24 Jun 2021 11:38:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B7134157D;
	Thu, 24 Jun 2021 09:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMTP_qbdo8BQ; Thu, 24 Jun 2021 09:38:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E09964157C;
	Thu, 24 Jun 2021 09:38:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C613C0022;
	Thu, 24 Jun 2021 09:38:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C599C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 09:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E94F54157B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 09:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPrqOGz_wDwq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 09:38:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F0534157A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624527497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LKNUi0k8rkFRiSDNVQX2m8iBhPkrBgoksmL90oHMfl0=;
 b=dmDZ61JG1BdxIPSWoY2fC9wgfU+kF3fFNyAWEjutL0IHSO/hgpV3mIYuclZ8wn5Q0C1DJo
 3rrdDupW/DsJgy60qdzc0R2vAP9a8hW+QBNM3Rk6P+tbgER0jKEWH1E2I/FAJuZCSRq7tV
 Z5pGxm+j2q3HVWGuPnT6R5mdiBXWabs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-7mmqBCrJMY-1sgvizixHOg-1; Thu, 24 Jun 2021 05:38:14 -0400
X-MC-Unique: 7mmqBCrJMY-1sgvizixHOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B9EB19200C2;
 Thu, 24 Jun 2021 09:38:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FDDB5D9F0;
 Thu, 24 Jun 2021 09:38:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0B66D180060E; Thu, 24 Jun 2021 11:38:11 +0200 (CEST)
Date: Thu, 24 Jun 2021 11:38:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/qxl: Remove empty qxl_gem_prime_mmap()
Message-ID: <20210624093811.wv7tcpl52yy5fw2d@sirius.home.kraxel.org>
References: <20210624090500.8320-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210624090500.8320-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org
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

On Thu, Jun 24, 2021 at 11:05:00AM +0200, Thomas Zimmermann wrote:
> The function qxl_gem_prime_mmap() returns an error. The two callers
> of gem_prime_mmap are drm_fbdev_fb_mmap() and drm_gem_dmabuf_mmap(),
> which both already handle NULL-callbacks with an error code. So clear
> gem_prime_mmap in qxl and remove qxl_gem_prime_mmap().

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
