Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A9068114ED3
	for <lists.virtualization@lfdr.de>; Fri,  6 Dec 2019 11:13:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3DCC425E5D;
	Fri,  6 Dec 2019 10:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ih8DE0v-omru; Fri,  6 Dec 2019 10:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ACA2225E23;
	Fri,  6 Dec 2019 10:13:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93D34C077D;
	Fri,  6 Dec 2019 10:13:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3ED8C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Dec 2019 10:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D3C4F88B26
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Dec 2019 10:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85nthesoPafP
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Dec 2019 10:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BAA7088B41
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Dec 2019 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575627191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjFRH+KKy9lVo/LpjoVhiAMNpklSmLSTjCgJyK72eTk=;
 b=e1vNJNKvuZV/tVHTwCxSJiNMOGnRQYw1fzIrpdFIT05+HtDxoLuQJDXPzW1ydBlCEaO8OO
 xyOCoBQTmyffAf8mEC0/AF4cxfZNhQ8lwYLIOdf9HqZCWxi57iqkEMUgszvwX82Om/hY+j
 +C301YlQ+DHQRvT8uH+31J4cRzpeNCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-_P5lLl6yMu6earcgehqAzw-1; Fri, 06 Dec 2019 05:13:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B89451005512;
 Fri,  6 Dec 2019 10:13:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF2885D6A3;
 Fri,  6 Dec 2019 10:13:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 10F2416E18; Fri,  6 Dec 2019 11:13:06 +0100 (CET)
Date: Fri, 6 Dec 2019 11:13:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Aditya Pakki <pakki001@umn.edu>
Subject: Re: [PATCH] drm/qxl: remove unnecessary BUG_ON check for handle
Message-ID: <20191206101306.rp2uxsmzgsshxey6@sirius.home.kraxel.org>
References: <20191205234231.10849-1-pakki001@umn.edu>
MIME-Version: 1.0
In-Reply-To: <20191205234231.10849-1-pakki001@umn.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: _P5lLl6yMu6earcgehqAzw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
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

On Thu, Dec 05, 2019 at 05:42:31PM -0600, Aditya Pakki wrote:
> In qxl_gem_object_create_with_handle(), handle's memory is not
> allocated on the heap. Checking for failure of handle via BUG_ON
> is unnecessary. This patch eliminates the check.

The check makes sure the caller doesn't pass in handle == NULL
and it is needed.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
