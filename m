Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF7246520
	for <lists.virtualization@lfdr.de>; Mon, 17 Aug 2020 13:08:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB69685427;
	Mon, 17 Aug 2020 11:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvBkzvsj0e1D; Mon, 17 Aug 2020 11:08:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5AFA985402;
	Mon, 17 Aug 2020 11:08:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A552C0895;
	Mon, 17 Aug 2020 11:08:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C17FEC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 11:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A802A87E99
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 11:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWtOoznu7Hrg
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 11:08:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DBABF87CDE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597662509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sRXpA3KVhG5i/ooij8DK6osX068yWEAfosvf8o3Zs6Y=;
 b=FdikwVe6XMAjVDMazCJzU9TngolgQd19DvpimGEtgtTvM8z/DxFWL4iNj1jCTuTQ5Sd1RP
 JuMi1ShX2C9dh0GOq0FQTqRBJuC6C9aEmExEJP1i/5AQNU+ma7BRrxyZawYzL7gp+pZTnD
 XsRPZsjvISQzgNakyaVHxbCg120V26M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-OQTjsRyGO2CmwRxlHku8Ow-1; Mon, 17 Aug 2020 07:08:28 -0400
X-MC-Unique: OQTjsRyGO2CmwRxlHku8Ow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C4B2185E53C;
 Mon, 17 Aug 2020 11:08:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3997310013C2;
 Mon, 17 Aug 2020 11:08:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 201FA9D8F; Mon, 17 Aug 2020 13:08:24 +0200 (CEST)
Date: Mon, 17 Aug 2020 13:08:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/qxl: Replace deprecated function in qxl_display
Message-ID: <20200817110824.ascomag3nh7ufabs@sirius.home.kraxel.org>
References: <20200524022624.10363-1-realwakka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200524022624.10363-1-realwakka@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
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

On Sun, May 24, 2020 at 11:26:23AM +0900, Sidong Yang wrote:
> Hi, Dave.
> 
> This is resended e-mail for your advice.
> 
> I'm a newbie interested in linux kernel and qxl module.
> Please check this patch and give me advice for me.
> Also I'll be glad if there is any task that you bothered.
> Thanks.
> 
> Sidong.
> 
> Replace deprecated function drm_modeset_lock/unlock_all with
> helper function DRM_MODESET_LOCK_ALL_BEGIN/END.
> 
> Signed-off-by: Sidong Yang <realwakka@gmail.com>

Queued for drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
