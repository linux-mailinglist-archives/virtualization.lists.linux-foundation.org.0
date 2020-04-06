Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894119F59A
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 14:12:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DFE11884C5;
	Mon,  6 Apr 2020 12:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMytGuENRisl; Mon,  6 Apr 2020 12:12:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71BC1884BF;
	Mon,  6 Apr 2020 12:12:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5441EC0177;
	Mon,  6 Apr 2020 12:12:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CC53C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 562B587C24
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LoTkJAWMCIlS
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:12:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 78B0186CC5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586175169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ouQfW90npHD033GMDM+a2FinSD7SQ9pCB41aFB2pv8M=;
 b=erBtvvthDEXSWpstqM67JfBIHDh7CGvDx4Qr3tfsmZPcnQvVguSfU9yxPAc8T42BoF8442
 4Dh7HDkXEE/wOKUlpnDgyVgR/Ct5QbPD8Nl9QMKNpXtvXE0VVMiXEB8KWU2saHKPHXefax
 YLwzZumfWf39ZurTouLYA0BGq3rZbVM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-rysEEb85O5Wsp1Gj8y4__w-1; Mon, 06 Apr 2020 08:12:45 -0400
X-MC-Unique: rysEEb85O5Wsp1Gj8y4__w-1
Received: by mail-wr1-f70.google.com with SMTP id q9so1154676wrw.22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 05:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ouQfW90npHD033GMDM+a2FinSD7SQ9pCB41aFB2pv8M=;
 b=DqD1KjQ/2tyB4MBTDIMf2qfhARQTpI7Xqt3qoZEa42JE+xSlwRuQVhH7/IxRxC1JSv
 9xZmvISQJWmG2hYw3Lqg0dDWZTW8w/jPM3n9NI9xX+d0Ww9W8BeQjvwxvV7cOEILS3mU
 79cwEE1yzhbdd69+4ZHlAKFXeW+0Q1DloKpQNB6uTLS1b4JbZv3dhiDLVk68dEtNERgh
 /oyeA6IAu6XxanOydYyF+Ygj0k8nOlAswPtUEZu3QC9v8EgbnYdedOBT0vDURKdrK1GS
 jMDdSaYEBAF5rVFfICO2Wv5mzQJLHfFMqUNrqRtuufaM6cgkSs/Vh/7Bt0bboEJHbvaw
 DZhQ==
X-Gm-Message-State: AGi0PuZeLbLm5v4754OnGCsUNptzlI2pXNG8jQWq3tilUIAZXH/rzuFL
 h9FaA5YA6PC6sR0J3bzwCmyKe8Nv1lleB2ejV2iF1bz44K8AN+FCvrj6+GVyF2rOyUOQFP3md49
 TeAlYxfd6JAp5J5sj3BZgQYTVgzifu6YKoGTfq8GHHQ==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr20975147wmj.12.1586175164696; 
 Mon, 06 Apr 2020 05:12:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypK4UDlctUcc5AyT0Y1eM00Stu92bOV1riiMCGdPiZpDMtuNKkpU/qBM4BYhbqFnYLAuIIxflQ==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr20975119wmj.12.1586175164472; 
 Mon, 06 Apr 2020 05:12:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h13sm870991wru.64.2020.04.06.05.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 05:12:43 -0700 (PDT)
Date: Mon, 6 Apr 2020 08:12:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] vdpa-sim: depend on HAS_DMA
Message-ID: <20200406121233.109889-2-mst@redhat.com>
References: <20200406121233.109889-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406121233.109889-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kbuild test robot <lkp@intel.com>,
 "christophe.lyon@st.com" <christophe.lyon@st.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 virtualization@lists.linux-foundation.org,
 "daniel.santos@pobox.com" <daniel.santos@pobox.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

set_dma_ops isn't available on all architectures:

        make ARCH=um
...

   drivers/vdpa/vdpa_sim/vdpa_sim.c: In function 'vdpasim_create':
>> drivers/vdpa/vdpa_sim/vdpa_sim.c:324:2: error: implicit declaration of function 'set_dma_ops'; did you mean 'set_groups'?
+[-Werror=implicit-function-declaration]
     set_dma_ops(dev, &vdpasim_dma_ops);
     ^~~~~~~~~~~
     set_groups

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 08b615f2da39..d0cb0e583a5d 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -14,7 +14,7 @@ if VDPA_MENU
 
 config VDPA_SIM
 	tristate "vDPA device simulator"
-	depends on RUNTIME_TESTING_MENU
+	depends on RUNTIME_TESTING_MENU && HAS_DMA
 	select VDPA
 	select VHOST_RING
 	select VHOST_IOTLB
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
