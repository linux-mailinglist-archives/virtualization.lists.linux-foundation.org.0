Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B89731A66DF
	for <lists.virtualization@lfdr.de>; Mon, 13 Apr 2020 15:22:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 66C608484F;
	Mon, 13 Apr 2020 13:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PsNlXuFEwVP; Mon, 13 Apr 2020 13:22:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F1B58488E;
	Mon, 13 Apr 2020 13:22:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66B76C1797;
	Mon, 13 Apr 2020 13:22:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70909C1797
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 13:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 59711203EB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 13:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJXMjvP0ByID
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 13:22:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 5AFF72000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 13:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586784152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0PdiEszlmuGkdCTdCPanAdeTLpgTEN2jG8uLZ7FuSm8=;
 b=hDLc1NYKVNGeycguxmXSYnt67NmWEuCHfRwdSB+lhculE6vx3eN90MX/Mp8yMax7j5ox/t
 R4NL7NN1HHspEEhPnF3PC8x0syrVKMmwETDuO3dPBQ6RA9ZUNMBhXDgOlbF4I/GPNtU+rc
 2MRJT+6ozvgqipLN5wjErDxBLJVpEJM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-sSpeqJ6RPHeh3_K9X2SHoQ-1; Mon, 13 Apr 2020 09:22:30 -0400
X-MC-Unique: sSpeqJ6RPHeh3_K9X2SHoQ-1
Received: by mail-wr1-f71.google.com with SMTP id v14so6690380wrq.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 06:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0PdiEszlmuGkdCTdCPanAdeTLpgTEN2jG8uLZ7FuSm8=;
 b=n17GhTD5fCjEMPMnNyHpk/6RfIzj/SaRkujdUosPk/M3Vq/CElKbNbI8RiPwqnJ0Yq
 dnscF1wrxgaHmoBMXEB1XTGUJ1S9Wymac8IWNSBP821bbXAr5q8vg4jVoVbnl1bcydMJ
 v2lAvWmwPLGt+pWPQ3dZ9kxiwDe2ZBdw9toQjnvZoXCQrTl4lIj4rOx62zx/3SC1I6Ij
 7k0LUaDQTQd4pMYfZMIosMYDr644F1iCalSDb6SvYmRyL2ADccjMnEwbsXCqdvXPATkr
 0gFbW3GRpUTam+aH+HgUJGhxu9OImQbQIOZ/29PfULoauD6/YCYRFv/mgpJZxFo0DrD6
 WzZg==
X-Gm-Message-State: AGi0PuZfAKfPnRjgCxzr/bwKRi6g2Oc9EjZ2+347rxCK1CeARIPEKhNq
 tD/vtgpUxws67s0uFMZbTl1NFFsL6/x3AvHqwCd2kcPZd+n/nFuUIkTXmh0JKo6J1yA0ULyWQ8y
 7S3RWZHNC85c9YZq6SzKbod/11PNZxUGhGj7zK6cDlQ==
X-Received: by 2002:adf:f343:: with SMTP id e3mr10209300wrp.51.1586784149266; 
 Mon, 13 Apr 2020 06:22:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJEAGSwrzL3vQ67rkOtqT1/sfEwf7eMuRq2HTHdDqkOFbKnqIPy+fW8j5vivRuXTGBlXzeIlQ==
X-Received: by 2002:adf:f343:: with SMTP id e3mr10209287wrp.51.1586784149081; 
 Mon, 13 Apr 2020 06:22:29 -0700 (PDT)
Received: from redhat.com ([185.107.45.41])
 by smtp.gmail.com with ESMTPSA id b82sm15672990wme.25.2020.04.13.06.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 06:22:28 -0700 (PDT)
Date: Mon, 13 Apr 2020 09:22:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200413091355-mutt-send-email-mst@kernel.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200228172537.377327-2-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eric.auger@redhat.com, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, jacob.jun.pan@intel.com, bhelgaas@google.com,
 robin.murphy@arm.com, joro@8bytes.org
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

On Fri, Feb 28, 2020 at 06:25:36PM +0100, Jean-Philippe Brucker wrote:
> diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
> index 237e36a280cb..ec57d215086a 100644
> --- a/include/uapi/linux/virtio_iommu.h
> +++ b/include/uapi/linux/virtio_iommu.h
> @@ -16,6 +16,7 @@
>  #define VIRTIO_IOMMU_F_BYPASS			3
>  #define VIRTIO_IOMMU_F_PROBE			4
>  #define VIRTIO_IOMMU_F_MMIO			5
> +#define VIRTIO_IOMMU_F_TOPOLOGY			6
>  
>  struct virtio_iommu_range_64 {
>  	__le64					start;
> @@ -27,6 +28,12 @@ struct virtio_iommu_range_32 {
>  	__le32					end;
>  };
>  
> +struct virtio_iommu_topo_config {
> +	__le32					offset;

Any restrictions on offset? E.g. alignment?

> +	__le32					num_items;
> +	__le32					item_length;
> +};
> +
>  struct virtio_iommu_config {
>  	/* Supported page sizes */
>  	__le64					page_size_mask;
> @@ -36,6 +43,25 @@ struct virtio_iommu_config {
>  	struct virtio_iommu_range_32		domain_range;
>  	/* Probe buffer size */
>  	__le32					probe_size;
> +	struct virtio_iommu_topo_config		topo_config;
> +};
> +
> +#define VIRTIO_IOMMU_TOPO_PCI_RANGE		0x1
> +#define VIRTIO_IOMMU_TOPO_ENDPOINT		0x2
> +
> +struct virtio_iommu_topo_pci_range {
> +	__le16					type;
> +	__le16					hierarchy;
> +	__le16					requester_start;
> +	__le16					requester_end;
> +	__le32					endpoint_start;
> +};
> +
> +struct virtio_iommu_topo_endpoint {
> +	__le16					type;
> +	__le16					reserved;
> +	__le32					endpoint;
> +	__le64					address;
>  };
>  
>  /* Request types */

As any UAPI change, this needs to be copied to virtio TC.

I believe an old version of QEMU patches was published there
but I don't think it was the latest one you tested against.

Description should preferably be added to spec too.

In partucular please add comments (in this header, too)
documenting the new fields, values and structures.

> -- 
> 2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
