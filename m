Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456023EC51
	for <lists.virtualization@lfdr.de>; Fri,  7 Aug 2020 13:22:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4A102253D4;
	Fri,  7 Aug 2020 11:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OtvC+cM3FWQ; Fri,  7 Aug 2020 11:22:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E062824FA8;
	Fri,  7 Aug 2020 11:22:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAB71C004C;
	Fri,  7 Aug 2020 11:22:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8543C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 11:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B6E2088905
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 11:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mc1imhlOgpnY
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 11:22:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3B59088904
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596799348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cYOzzMQ/5Pz2gxVyfxrOyOInaBGjLZuQwDWYrECBlYE=;
 b=Fvw4Yg1yHo5p8ag0WQZOTJJWK9B4kcSAQNd5RDK6PuD7bcuaugY6pnd6eoxsWWvBzF8bRb
 /8Jn0EFpEvsSOMCx/j5eAwcml3PSduJM+PMWuy25kAbZHAXhZaqzXQ7L4GeGjdNCsFeK2N
 5YjEqDY8yU7dt/aCDUKmHnV6RSPvSzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-FMsxcogXOE-ix8JgUM4iKQ-1; Fri, 07 Aug 2020 07:22:24 -0400
X-MC-Unique: FMsxcogXOE-ix8JgUM4iKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 658CD8017FB;
 Fri,  7 Aug 2020 11:22:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FA1A108AA;
 Fri,  7 Aug 2020 11:22:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A4047828; Fri,  7 Aug 2020 13:22:18 +0200 (CEST)
Date: Fri, 7 Aug 2020 13:22:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 10/38] virtio_gpu: correct tags for config space fields
Message-ID: <20200807112218.gbjiwdxjfzd7h6ah@sirius.home.kraxel.org>
References: <20200805134226.1106164-1-mst@redhat.com>
 <20200805134226.1106164-11-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805134226.1106164-11-mst@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: David Airlie <airlied@linux.ie>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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

On Wed, Aug 05, 2020 at 09:43:42AM -0400, Michael S. Tsirkin wrote:
> Since gpu is a modern-only device,
> tag config space fields as having little endian-ness.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
