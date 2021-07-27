Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C72463D6DFE
	for <lists.virtualization@lfdr.de>; Tue, 27 Jul 2021 07:24:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D96C605EB;
	Tue, 27 Jul 2021 05:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCUzY18NUo-c; Tue, 27 Jul 2021 05:24:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 13964607D6;
	Tue, 27 Jul 2021 05:24:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1FAFC000E;
	Tue, 27 Jul 2021 05:24:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6793EC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Jul 2021 05:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A14B403A9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Jul 2021 05:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6l_gQIJHhAk6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Jul 2021 05:24:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25DEA402C8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Jul 2021 05:24:18 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id f13so3987423plj.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 22:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ruqu7XRyeoHO5d3dL3cpXjWaNCM/mJSqSGYC+47F2jM=;
 b=OK5Eq5EaYOj7pmvubgA/5zHGMhwmsXjjVac7YqdjIyrJAuYnBWil+CUwlP04n+LrdT
 f5NKctWjool1sMCzalGRQvx6uWxHQeH0ophl0ANynHrmCxpgHGRQmAxEqwdIo+eT4KDQ
 WLDPo8iG6MTUXW1jAcwHZu0N2HmZNkGgfXq6CU1BwTjN11zZVyUjStSvUvZHsjxeBlmH
 NWp7U7o5qADjx99jjJCRKdgiwdXKD5RvwtZaDletZ4v0zzsCbg511OuTR4OoWLgk30Jq
 NfULFuLm1p74l06sdwm4e0TV5w1i1+ZVtfOSnHu/Y25TVbNzI1Zx4Y0bF3t2WzRxEdHx
 fNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ruqu7XRyeoHO5d3dL3cpXjWaNCM/mJSqSGYC+47F2jM=;
 b=hoLVMMAWmuk0WK5Vydduf7MHs5VN7sca6BImWS9XGx55YLvYTICuRPl3WTlVkUAQ+b
 WNYReHUkeMRXbIDNhNQ8K8jtgF4KNY88eTe+4xsdI0wJhlWCxmW9zT1EqxyNF68fH/5y
 wZRahmZ71cP+7vd4Z+cgpIlrrhG/O2w1Bb9hUwRY9PPk4AiGjIg0alj2yWSnoX6WYFZ8
 axhMIbQRToGeJMYPqvuliW4JHgy1/IrVI8rZOztQnfLP48LKBspCyCiD5PPta3R8kJZX
 GSb3ThvAAkuCjumrHdRSP1U6i2mUC+R9eUuM61WpBot+RSsseD2S8DDLM9hKtCoLKIKS
 Tz8Q==
X-Gm-Message-State: AOAM532sCBENSTgNiH0bL7FQkZva+MSTtdfqZHTArVqgExhlSRvHPBEK
 wa1HKS1f3gWTESAVC3vUD1YWDQ==
X-Google-Smtp-Source: ABdhPJxlr8ST+l2zqQmOHJ0yxqdkfMipSP8p24NTpOJ3+QodP4SrF5kCmLao8p6wsWQn0kOydjR5og==
X-Received: by 2002:a17:90b:ec5:: with SMTP id
 gz5mr5361661pjb.77.1627363457626; 
 Mon, 26 Jul 2021 22:24:17 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id c23sm1929324pfo.174.2021.07.26.22.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 22:24:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V4 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
Date: Tue, 27 Jul 2021 10:53:50 +0530
Message-Id: <acf7402ef4aabc0ad6295c32846f2bef1cd9b56a.1627362340.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1627362340.git.viresh.kumar@linaro.org>
References: <cover.1627362340.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Bill Mills <bill.mills@linaro.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-gpio@vger.kernel.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
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

This patch adds binding for virtio GPIO controller, it is based on
virtio-device bindings.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../devicetree/bindings/gpio/gpio-virtio.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
new file mode 100644
index 000000000000..601d85754577
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio GPIO controller
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+allOf:
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+description:
+  Virtio GPIO controller, see /schemas/virtio/virtio-device.yaml for more
+  details.
+
+properties:
+  $nodename:
+    const: gpio
+
+  compatible:
+    const: virtio,device29
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
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    virtio@3000 {
+        compatible = "virtio,mmio";
+        reg = <0x3000 0x100>;
+        interrupts = <41>;
+
+        gpio {
+            compatible = "virtio,device29";
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
