Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B563D52A0
	for <lists.virtualization@lfdr.de>; Mon, 26 Jul 2021 06:52:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B88F82A26;
	Mon, 26 Jul 2021 04:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kMhS4yafk23; Mon, 26 Jul 2021 04:51:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 070D282B5E;
	Mon, 26 Jul 2021 04:51:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96A07C000E;
	Mon, 26 Jul 2021 04:51:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ECEAC000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 04:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 408924016A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 04:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lC-tNDCGd4Xh
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 04:51:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A9A4400AF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 04:51:55 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d1so2879908pll.1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 21:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJObmosw0ECxR5bJoxzM8fJ9A3xHxXUklA4Az95YtEw=;
 b=v7SItLgkseAmfU2SuQoWbIGar0knRK0cIjLDi+TJza2wkb62A0wyaMZI4pIbqEpqR3
 9D20yhOV9HG4H1AiGzztWiX33fsODizFsIMj863LwJ2VQpaDz/3V36RIir4OqV6uDX/1
 K44beOOsdsumld4Peg+pzllADsAKuxQ8z89dp9seCs0d9xpu+4YWMUL3FOf0LyibnV5k
 i1yKFLLsCF/sXIYMCeiSBYVczAP22hSukf5bkiroV8p8ksxpkvWN4eXGCusCyEWR5aFW
 4zV6AnUjLYKiGe8cQcsFr21zGL5WCm5JRKMOGXDJgyzoZ4PLuKd+EwGYLHW9psHvNH4C
 wGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJObmosw0ECxR5bJoxzM8fJ9A3xHxXUklA4Az95YtEw=;
 b=O6kY47lAMfPcMcshDofVWoETGHXqg21mstM2yw2yq8wWs+tU72vkB+ZjZMSXzIuVsu
 5WC78BfFhTBQaR92X2fcfTFZSSySq0sKeSBY2cZ3BGvC0q4u5NS7W3SphnzbJEHvDmtO
 h7Dm/kfihd2nGFGbjetj7zGw+GTaXdIXsL3B1O6UuctUgMWkfhogLFUT9g5V7zJid/30
 SdOOebxDpMLjlMaF3s2zBjklbtPB4X8PoF6H4R3ypcw37BNIPmWYxb5lB3J7Te1mfwQc
 5lk7ynNDeH/MxWugqF0JXdtk5JTFAA22ceFFM5KFB/5Acakp4W/ur2JNJCVGwRPLCL/4
 MnHw==
X-Gm-Message-State: AOAM531waL9XO5wOq/c7hE6ky273JQ0ESOmJnu2STc9TpzVfu2KJYShy
 4Siux5rT2nWLm4YVHjyI5DuRiA==
X-Google-Smtp-Source: ABdhPJy5OKEmuRfMBzlsPuZ2ShGKKwtJXiA4VYNNauDJf2d0UT0A/YpaXVGlAhHSV5jSoKAw4VDIFQ==
X-Received: by 2002:a63:5706:: with SMTP id l6mr16514459pgb.217.1627275114651; 
 Sun, 25 Jul 2021 21:51:54 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id v5sm46165190pgi.74.2021.07.25.21.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 21:51:53 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V3 0/5] virtio: Add virtio-device bindings
Date: Mon, 26 Jul 2021 10:21:40 +0530
Message-Id: <cover.1627273794.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Bill Mills <bill.mills@linaro.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, "Enrico Weigelt, metux IT consult" <info@metux.net>
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

Hi,

Currently the DT only provides support for following node types for virtio-mmio
nodes:

        virtio_mmio@a000000 {
                dma-coherent;
                interrupts = <0x00 0x10 0x01>;
                reg = <0x00 0xa000000 0x00 0x200>;
                compatible = "virtio,mmio";
        };

Here, each virtio-mmio corresponds to a virtio-device. But there is no way for
other users in the DT to show their dependency on virtio devices.

This patchset provides that support.

The first patch adds virtio-device bindings to allow for device sub-nodes to be
present and the second patch updates the virtio core to update the of_node.

Other patches add bindings for i2c and gpio devices.

Tested on x86 with qemu for arm64.

Pending:
- Arnd suggested that "virtio,deviceXX" may be a better compatible string, while
  I used "virtio,XX" to match what PCI and USB do currently. I didn't change it
  yet to hear Rob's view on the same before making the change, in case he has
  any preferences.

V2/2.1->V3:
- Added review-tags from Arnd and Wolfram.
- Only the 5th patch changed otherwise:
  - Use of_device_is_compatible() instead of keeping a list of devices.
  - Use snprintf (with BUG_ON on return value) to create the compatible string,
    whose length is fixed using "virtio,XXXXXXXX".
  - Use dev_of_node().

V1->V2:
- The changes (both binding and code) are made at virtio level, instead of
  virtio-mmio. This allows the same to be used by all device types, irrespective
  of the transport mechanism.

- Dropped the reg property and used compatible in the form "virtio,<DID>".

- Dropped dt-bindings/virtio/virtio_ids.h.

- Add a patch to sync virtio-ids from spec, required for the last patch.

--
Viresh

Viresh Kumar (5):
  dt-bindings: virtio: Add binding for virtio devices
  dt-bindings: i2c: Add bindings for i2c-virtio
  dt-bindings: gpio: Add bindings for gpio-virtio
  uapi: virtio_ids: Sync ids with specification
  virtio: Bind virtio device to device-tree node

 .../devicetree/bindings/gpio/gpio-virtio.yaml | 60 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-virtio.yaml   | 51 ++++++++++++++++
 .../devicetree/bindings/virtio/mmio.yaml      |  2 +-
 .../bindings/virtio/virtio-device.yaml        | 47 +++++++++++++++
 drivers/virtio/virtio.c                       | 57 +++++++++++++++++-
 include/uapi/linux/virtio_ids.h               | 12 ++++
 6 files changed, 225 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
 create mode 100644 Documentation/devicetree/bindings/virtio/virtio-device.yaml

-- 
2.31.1.272.g89b43f80a514

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
