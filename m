Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6076719DAEB
	for <lists.virtualization@lfdr.de>; Fri,  3 Apr 2020 18:10:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1736B2633A;
	Fri,  3 Apr 2020 16:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlgWb4uAbthf; Fri,  3 Apr 2020 16:10:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 15B8B26337;
	Fri,  3 Apr 2020 16:10:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9A96C07FF;
	Fri,  3 Apr 2020 16:10:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34AA8C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 16:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1FEC6892A8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 16:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmu86xlhkg7M
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 16:10:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D75A088B93
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 16:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585930235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LeoeQF7GvDwmPkvw2R/S0QmAmK/0A59bm6nJYVibxX4=;
 b=YaQS3HoCjO2iL1lU7Qq7OhPLDUUaBwoAwkNybr+IuwdEnH2wxZNEVb1/kw38svlLXP3CjD
 lh4pzbjGOQhMzZIO+CRTHgERlZ+BjDfax2n30Egkg5rjb4prKerS3q8Sd8jA/jj+pJreJe
 820xIVsp2x9aCs78l030SstRy9sb8jU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-amfFJ9vkPdC9PtzN2VeEdg-1; Fri, 03 Apr 2020 12:10:34 -0400
X-MC-Unique: amfFJ9vkPdC9PtzN2VeEdg-1
Received: by mail-wm1-f71.google.com with SMTP id a4so737420wmb.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Apr 2020 09:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LeoeQF7GvDwmPkvw2R/S0QmAmK/0A59bm6nJYVibxX4=;
 b=n+2Adzr8eGkp8RGYBRnG7SmVUoa62UUSzvEpx3Jo6nxfZrSZRLbCjasMV9adlN1m8E
 FJmdjvgbem40kgZtm+jjC0+ufjz+es3lO5I0bus0Fjle5RwEIQ+Cp3Cw+Kc3/mmRK9yZ
 Jz4FJx2YlUQ5916smkP+VbPkLfzIxDM1LvkEsyKo/GGeBmYHBTseV+vVEHL6pMoxGkMA
 xPfm2TLWYGwAvXEUwPy9hBepnV9f/SvpfyvXtaguZQJeInJeJuXOp5sEn/tT3dv4OZbW
 BqEGWpXhbK3wPkPb+uRBNhTCfnkTQ0eQEs+X2Oi8vcEqLVM2Hp7+jmn120e7QcRNcEFE
 lZJQ==
X-Gm-Message-State: AGi0PuY0IdpnAnDyoUK/3EGGK7Tgoq7vSo1kBUF/lLltxiFe8+ZG4gEm
 yhfGmG5RZIzpDTfdscSo4fKWnFMfSCjrDBk9oc+TUxBUJ7ovbnhh+S6EviVWaaQTjgeC/vt3jIE
 cU/dcWo36gvTmoq4BRJupO8zES2VAUz3wI+/Sv3a5CA==
X-Received: by 2002:a5d:4401:: with SMTP id z1mr9663507wrq.259.1585930232872; 
 Fri, 03 Apr 2020 09:10:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJPQpWckOqFouWM2ty3+B/I0oJ8XkRO7qyavBWXix0tAnRF2g6JD6t97ZbwvnEPMH4gZoU5vw==
X-Received: by 2002:a5d:4401:: with SMTP id z1mr9663491wrq.259.1585930232684; 
 Fri, 03 Apr 2020 09:10:32 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id b187sm13009825wmc.14.2020.04.03.09.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 09:10:32 -0700 (PDT)
Date: Fri, 3 Apr 2020 12:10:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] vhost: drop vring dependency on iotlb
Message-ID: <20200403161011.13046-3-mst@redhat.com>
References: <20200403161011.13046-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200403161011.13046-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

vringh can now be built without IOTLB.
Select IOTLB directly where it's used.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/Kconfig  | 1 +
 drivers/vhost/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 7db1460104b7..08b615f2da39 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -17,6 +17,7 @@ config VDPA_SIM
 	depends on RUNTIME_TESTING_MENU
 	select VDPA
 	select VHOST_RING
+	select VHOST_IOTLB
 	default n
 	help
 	  vDPA networking device simulator which loop TX traffic back
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index f0404ce255d1..cb6b17323eb2 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -8,7 +8,6 @@ config VHOST_IOTLB
 
 config VHOST_RING
 	tristate
-	select VHOST_IOTLB
 	help
 	  This option is selected by any driver which needs to access
 	  the host side of a virtio ring.
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
