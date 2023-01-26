Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D35D067CABB
	for <lists.virtualization@lfdr.de>; Thu, 26 Jan 2023 13:17:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B80A419BB;
	Thu, 26 Jan 2023 12:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B80A419BB
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J0NLwRny
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EanISJv4xiaL; Thu, 26 Jan 2023 12:17:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E45D541975;
	Thu, 26 Jan 2023 12:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E45D541975
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21D1AC0077;
	Thu, 26 Jan 2023 12:17:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99366C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Jan 2023 12:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6571860D54
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Jan 2023 12:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6571860D54
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=J0NLwRny
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZneLP-iy9rhD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Jan 2023 12:17:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B375060B70
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B375060B70
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Jan 2023 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674735431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JmjWDDDaOKoHLyiWRUyi7QZP+P/9RQam7lY9KQxWlvQ=;
 b=J0NLwRnyABG1OXCAKjRI5SeitPVSBZWxbqsReuugDSSlJWEs3JwxV4Q04Ip5IxpM2CHYoO
 3G3na06QrrDXXPfmsZyNt2rWLi6VyUAxhsgyhjGTjRGfqAfx602gcrRQ2ZD7eL3Ich7DVU
 Nz+eQRz4oYWeHPtKxotUCthRx7SR3q0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-StpZteGWPNupwA7THPGiNA-1; Thu, 26 Jan 2023 07:17:07 -0500
X-MC-Unique: StpZteGWPNupwA7THPGiNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC0233C42204;
 Thu, 26 Jan 2023 12:17:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 872EB140EBF5;
 Thu, 26 Jan 2023 12:17:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 57F9B180093F; Thu, 26 Jan 2023 13:17:05 +0100 (CET)
Date: Thu, 26 Jan 2023 13:17:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v10 06/11] drm/shmem-helper: Don't use vmap_use_count for
 dma-bufs
Message-ID: <20230126121705.wsm62yxco7cubwyf@sirius.home.kraxel.org>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-7-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230108210445.3948344-7-dmitry.osipenko@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Cc: dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Herring <robh@kernel.org>, Daniel Stone <daniel@fooishbar.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
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

On Mon, Jan 09, 2023 at 12:04:40AM +0300, Dmitry Osipenko wrote:
>  its own refcounting of vmaps, use it instead of drm-shmem
> counting. This change prepares drm-shmem for addition of memory shrinker
> support where drm-shmem will use a single dma-buf reservation lock for
> all operations performed over dma-bufs.

Likewise truncated?

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
