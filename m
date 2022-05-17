Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3AB5295FE
	for <lists.virtualization@lfdr.de>; Tue, 17 May 2022 02:27:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB6C84056C;
	Tue, 17 May 2022 00:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAQiklREVwwp; Tue, 17 May 2022 00:27:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7C6EB40531;
	Tue, 17 May 2022 00:27:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E43D1C0081;
	Tue, 17 May 2022 00:27:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A426C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 May 2022 00:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6308060FA5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 May 2022 00:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eTEZXnoNGFh
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 May 2022 00:27:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4736160D61
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 May 2022 00:27:53 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id w123so20638554oiw.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 May 2022 17:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AjIgoIzuU0qN1OneU4nydD9785iHKfz2mgfXgmyiwBA=;
 b=JvF6zHnry8MbCPka/lF0JCk1TyIt84C99FMmdnF6izFnmW/rv23YbZ9yQznOM5KT04
 OhPTMt7gcQIko7VNaf/tYE7f4YBPqEgBCxUZZrSbH2qy9F8Z0oGyidBclKtCm1I13wLn
 fQEFNoCHJlNWI6KY8QU8Mlw3POq7/1cK0/b3BchzXUSfCEEwUFX9e0PbzmgLd4OWGRHZ
 wQyGRSmVt14mbXKBNci/5VDlXBe8ixkIOErSaEwUdlkYh/aswZF4F/9G2BNae9vR0ka3
 gCirVpy/P1E2j0fhugeWz86Ni3HkZf1T0arl7P8rOLoLn8PmApSeH8vq4D8Fep9VYW5B
 kGDw==
X-Gm-Message-State: AOAM5300L6tV5S8sQnDE85fDKlHRQ1q7NXwQ3xmBc55Ayrx+kfbqpqQq
 oOekXivs0Oo3PVx0T47L9Q==
X-Google-Smtp-Source: ABdhPJxT0vsAGu7gI2XEFSb7VXPXh7GjkIgGl9JGJgCiHApDSgmjmwIdM+VP2LsLjTK10XA7StATnw==
X-Received: by 2002:a05:6808:1496:b0:326:e2de:63ec with SMTP id
 e22-20020a056808149600b00326e2de63ecmr9397520oiw.271.1652747272138; 
 Mon, 16 May 2022 17:27:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t129-20020aca5f87000000b00328a1be5c3asm4429079oib.25.2022.05.16.17.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 17:27:51 -0700 (PDT)
Received: (nullmailer pid 3649667 invoked by uid 1000);
 Tue, 17 May 2022 00:27:50 -0000
Date: Mon, 16 May 2022 19:27:50 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
Message-ID: <20220517002750.GA3638680-robh@kernel.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, devicetree@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 xen-devel@lists.xenproject.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Sat, May 07, 2022 at 09:19:06PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Introduce Xen specific binding for the virtualized device (e.g. virtio)
> to be used by Xen grant DMA-mapping layer in the subsequent commit.
> 
> This binding indicates that Xen grant mappings scheme needs to be
> enabled for the device which DT node contains that property and specifies
> the ID of Xen domain where the corresponding backend resides. The ID
> (domid) is used as an argument to the grant mapping APIs.
> 
> This is needed for the option to restrict memory access using Xen grant
> mappings to work which primary goal is to enable using virtio devices
> in Xen guests.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes RFC -> V1:
>    - update commit subject/description and text in description
>    - move to devicetree/bindings/arm/
> 
> Changes V1 -> V2:
>    - update text in description
>    - change the maintainer of the binding
>    - fix validation issue
>    - reference xen,dev-domid.yaml schema from virtio/mmio.yaml
> ---
>  .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/virtio/mmio.yaml |  7 ++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> new file mode 100644
> index 00000000..750e89e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xen specific binding for virtualized devices (e.g. virtio)
> +
> +maintainers:
> +  - Stefano Stabellini <sstabellini@kernel.org>
> +
> +select: true

Omit. No need to apply this on every single node.

> +
> +description:
> +  This binding indicates that Xen grant mappings need to be enabled for
> +  the device, and it specifies the ID of the domain where the corresponding
> +  device (backend) resides. The property is required to restrict memory
> +  access using Xen grant mappings.
> +
> +properties:
> +  xen,dev-domid:

I kind of think 'dev' is redundant. Is there another kind of domid 
possible? Maybe xen,backend-domid or just xen,domid? I don't know Xen 
too well, so ultimately up to you all.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The domid (domain ID) of the domain where the device (backend) is running.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    virtio@3000 {
> +            compatible = "virtio,mmio";
> +            reg = <0x3000 0x100>;
> +            interrupts = <41>;
> +
> +            /* The device is located in Xen domain with ID 1 */
> +            xen,dev-domid = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/virtio/mmio.yaml b/Documentation/devicetree/bindings/virtio/mmio.yaml
> index 10c22b5..29a0932 100644
> --- a/Documentation/devicetree/bindings/virtio/mmio.yaml
> +++ b/Documentation/devicetree/bindings/virtio/mmio.yaml
> @@ -13,6 +13,9 @@ description:
>    See https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio for
>    more details.
>  
> +allOf:
> +  - $ref: /schemas/arm/xen,dev-domid.yaml#
> +
>  properties:
>    compatible:
>      const: virtio,mmio
> @@ -33,6 +36,10 @@ properties:
>      description: Required for devices making accesses thru an IOMMU.
>      maxItems: 1
>  
> +  xen,dev-domid:
> +    description: Required when Xen grant mappings need to be enabled for device.
> +    $ref: /schemas/types.yaml#/definitions/uint32

No need to define the type again nor describe it again.

Instead, just change additionalProperties to unevaluateProperties in 
this doc. The diff is the latter takes $ref's into account.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.7.4
> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
