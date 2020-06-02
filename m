Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFEB1EB4E8
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 07:08:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C097E86CF9;
	Tue,  2 Jun 2020 05:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgNj6xYlUFBx; Tue,  2 Jun 2020 05:08:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C82386B11;
	Tue,  2 Jun 2020 05:08:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3B4FC0176;
	Tue,  2 Jun 2020 05:08:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08F21C0176
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E4B4187D0E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gnnniBA+zAk
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:08:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3029887CC9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591074489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i21+6+jn+AssAfqfuTEOtmF/3IbU/JSkgC0yQOaoU/8=;
 b=IvyBSi6+ZoNquPZyms5jgPjxCeOeNZHDiEFxwlWpQvtAdJtak8XTOh9PJyuLoEpb66wfmP
 6j3ZujQl1ABAGnB3KC1BA+LuBkB1KI4AsYpgOWiN3BLPSEN+eXPfEsKTI7RoHnv+bWjkQZ
 OLOTw7Wb3kaurbLIStZq30kXXHLU60o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-exRycBJ7N8mjS0cHqYxaiw-1; Tue, 02 Jun 2020 01:08:08 -0400
X-MC-Unique: exRycBJ7N8mjS0cHqYxaiw-1
Received: by mail-wr1-f71.google.com with SMTP id f4so873947wrp.21
 for <virtualization@lists.linux-foundation.org>;
 Mon, 01 Jun 2020 22:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i21+6+jn+AssAfqfuTEOtmF/3IbU/JSkgC0yQOaoU/8=;
 b=oEQUGxCx/fXsbrPvyeVWyovu0viz1L/S82O95VHCtEsJfSCm/JY3AmEFE3ijLT5fvm
 pYyZ11pfcg06QzcNS044aTJLJHLOqddE9lsyHM4s7qqcMjhQWXvV7y3NMgGt09VRT2LC
 XnMsTHYKijwhU4zQE69/R82KHYaNZ+GG96FzKyqbau5hXgpc/ealxcm1wMp3SEJp21SN
 bF9hwo636ud2GfbmwNQl5P++0QOGGX2rJWLp/3G0WJuKzpAcg0cRmHTzD+gRrzRBETY5
 9Yj8CxLEhQRGxKsOBR5MJZYLA/1UWyjaSrtUgfyO9/xwLCv9qdVU/mKdfjrC9G6UcsGX
 O74Q==
X-Gm-Message-State: AOAM533CRZjQZG5wmN6a1aX2OC/SdDRLdVscpjKhYuI8gXow0jPpPUrH
 eDeAK1qQuenWj9RLiH7cnKu1nWy3ZLg/+Gt6KMZiwoEQ2z1y3Ho0RQ4WoVfI3zGlIPJ5xquFvtc
 XRk6pkKl6VXlDawWZN0lak6cOURHNMkpCfSdmqW7+1w==
X-Received: by 2002:a5d:4c81:: with SMTP id z1mr26712889wrs.371.1591074487435; 
 Mon, 01 Jun 2020 22:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7ZFXMW684yAQznwucY1IA0VuesC1zA8zze+z7mJFUahZ6qoJQid59fnWEYmNevYhEMFGybw==
X-Received: by 2002:a5d:4c81:: with SMTP id z1mr26712868wrs.371.1591074487279; 
 Mon, 01 Jun 2020 22:08:07 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 a126sm1761521wme.28.2020.06.01.22.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 22:08:06 -0700 (PDT)
Date: Tue, 2 Jun 2020 01:08:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200602010332-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200529080303.15449-6-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

On Fri, May 29, 2020 at 04:03:02PM +0800, Jason Wang wrote:
> +static void vp_vdpa_set_vq_ready(struct vdpa_device *vdpa,
> +				 u16 qid, bool ready)
> +{
> +	struct vp_vdpa *vp_vdpa = vdpa_to_vp(vdpa);
> +
> +	vp_iowrite16(qid, &vp_vdpa->common->queue_select);
> +	vp_iowrite16(ready, &vp_vdpa->common->queue_enable);
> +}
> +

Looks like this needs to check and just skip the write if
ready == 0, right? Of course vdpa core then insists on calling
vp_vdpa_get_vq_ready which will warn. Maybe just drop the
check from core, move it to drivers which need it?

...


> +static const struct pci_device_id vp_vdpa_id_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, PCI_ANY_ID) },
> +	{ 0 }
> +};

This looks like it'll create a mess with either virtio pci
or vdpa being loaded at random. Maybe just don't specify
any IDs for now. Down the road we could get a
distinct vendor ID or a range of device IDs for this.

> +MODULE_DEVICE_TABLE(pci, vp_vdpa_id_table);
> +
> +static struct pci_driver vp_vdpa_driver = {
> +	.name		= "vp-vdpa",
> +	.id_table	= vp_vdpa_id_table,
> +	.probe		= vp_vdpa_probe,
> +	.remove		= vp_vdpa_remove,
> +};
> +
> +module_pci_driver(vp_vdpa_driver);
> +
> +MODULE_AUTHOR("Jason Wang <jasowang@redhat.com>");
> +MODULE_DESCRIPTION("vp-vdpa");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION("1");
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
