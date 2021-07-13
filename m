Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC543C6EF0
	for <lists.virtualization@lfdr.de>; Tue, 13 Jul 2021 12:51:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3054038F;
	Tue, 13 Jul 2021 10:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cM3SE2n4bzeQ; Tue, 13 Jul 2021 10:51:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4617A405FB;
	Tue, 13 Jul 2021 10:51:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7898C000E;
	Tue, 13 Jul 2021 10:51:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94689C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 10:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74C82400F3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 10:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJHFpftIBg7n
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 10:51:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8448A40254
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 10:51:01 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id b12so7985013plh.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xzH7sesTaozGr2aBJCA9PbVMd+/TXsUDxdM6aSXl45Y=;
 b=UfdEgV6ejBlsj8JxfNTCpyqoujkZOrd26OFYbtyNGrFFn1w8vIXL3x/tuh8kYEN7zh
 gMfxw3nWN67wNY+Ia620l6fmfgeo/5SjhwpvWAQldauqCMbEN1360puiqwBIkfK5Q4uZ
 wpSwJXVJjy3E6hA7Xjo4ciCm1nwSoklVD0YtzlI7ndrcYmCfBkYSFY80XKzfNVNVyMst
 nFIHVvEmojYLFlPQ2vf2P4X/xU56jTh3kY+isL6DcaxrPFjSjGwGKwIfDMUc7lh/xYoG
 z4d/R32YPIe0nHFMqPqcSzBaoBw9/4vKH5Sp/SESjA6uqWTeDPV9t93lEi7qZGCipQA5
 YXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xzH7sesTaozGr2aBJCA9PbVMd+/TXsUDxdM6aSXl45Y=;
 b=TEjUNoDPHgeRm78NlQn0Sm7tUepc21dCDq/fP932gVRibv0xDki5wrtO3dydPK2dvW
 7d49Ty9q+ZLxTvC1kxMW143rZgx5X5JBGyh3iCSqb2YBz5vi7oGntEUUI2Bs+tu+x719
 vagzQU1niSPlXerQP+TnI0aWQks6gIDcSMb/xj+Alzs1zkgqla8QhxZN1tVeFC2uhAlA
 WQsVSJK/QmifZr0uppCQ/M5E4Wri68fkaHk28mbdMpLIB26Gp16XlabuktQw2rR5/3Dt
 UcQwarVyh4HY2rFBxA9LJMJ0g63thXDJdPw8itFBINaPvPQ7dzjLouQWFjvcYaSaBCmH
 BGXQ==
X-Gm-Message-State: AOAM5321MlWegR0F+I5XJvClO8SqOvaHJKsFeQLXDDoD4SvENHE+etJj
 boTzI8CuyS5g1x6tcWi+hUKELg==
X-Google-Smtp-Source: ABdhPJwILSYWfsnEQ84NtkqSWa5u44NasPrQyL0/31BO0LHU+8bXmC3BJV9TCS/WGUJGHGqqDIiLVA==
X-Received: by 2002:a17:90b:1294:: with SMTP id
 fw20mr18966339pjb.100.1626173460987; 
 Tue, 13 Jul 2021 03:51:00 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id i8sm5898474pfk.18.2021.07.13.03.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 03:51:00 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 5/5] dt-bindings: gpio: Add bindings for gpio-virtio
Date: Tue, 13 Jul 2021 16:20:34 +0530
Message-Id: <268086e273df0c53e3a9a1e751304c63e50ebe12.1626173013.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1626173013.git.viresh.kumar@linaro.org>
References: <cover.1626173013.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Bill Mills <bill.mills@linaro.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-gpio@vger.kernel.org,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
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

gpio-virtio represents a virtio GPIO controller and this patch adds
binding for the same. The gpio-virtio subnode can be part of a
virtio,mmio node and is based on its binding.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Depends on:

https://lore.kernel.org/lkml/7c716c2eb7ace5b5a560d8502af93101dbb53d24.1626170146.git.viresh.kumar@linaro.org/
---
 .../devicetree/bindings/gpio/gpio-virtio.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
new file mode 100644
index 000000000000..c813cdfd60fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio memory mapped GPIO controller
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+description:
+  Virtio GPIO controller, see /schemas/virtio/mmio.yaml for more details.
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+properties:
+  $nodename:
+    pattern: '^gpio-virtio@[0-9]+$'
+
+  reg:
+    description:
+      The cell is the device ID of the GPIO device (VIRTIO_ID_GPIO) as per
+      dt-bindings/virtio/virtio_ids.h.
+    const: 41
+    $ref: /schemas/virtio/mmio.yaml#/properties/reg
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/virtio/virtio_ids.h>
+
+    virtio@3000 {
+        compatible = "virtio,mmio";
+        reg = <0x3000 0x100>;
+        interrupts = <41>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio-virtio@0 {
+            reg = <VIRTIO_ID_GPIO>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
+
+...
-- 
2.31.1.272.g89b43f80a514

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
