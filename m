Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE334EFD7D
	for <lists.virtualization@lfdr.de>; Tue,  5 Nov 2019 13:45:30 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1184DAC;
	Tue,  5 Nov 2019 12:45:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B4D87DAC
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 12:45:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 967048AC
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 12:45:21 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3EBB81F2F
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 12:45:20 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id k9so22335902qtg.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 05 Nov 2019 04:45:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Zpg/4kjgf7XtdLxfj7GcnCPepLR91+b2naTPqg1H85Q=;
	b=bh3z2BrKizK7F9bkaS/yvujI8GaJITQjrKC3VlQ6ecQqVrK3301jbeEnAQF7TjQueq
	Dnzn+549rJdYKJ6LCgIkJv7XLF2zpI5h8+3Vw/9dIZ2HmvkmvmY1wSKt83P+P1fWjhAL
	nuK5ktN5vQWxztVSQGUFzhYTk2h3yZyQC6/TeWGjzHFIIW1ihwPnx82Oy+PCP1eJhFBn
	k43dKbgPLL4ZyUDBEMGySNaz6B1VluPatzso+V6na3jubpKCGXnCkzZnMApPamrIKiJo
	/ABKBXohk5VH+N/zn1q+qvu5Z5TU2Ld1hWOnYVWJcr5wwQhRonCkUnYJudxLZebzdHHx
	sZSg==
X-Gm-Message-State: APjAAAWdwfSR5/Hhc0IPHP3d6frkqByf17jGpeHEKGVmT5tyqN9xYpzO
	PXgrOBQT4ky6j12d/MwqITUWdv+eUtYsaMpVGm9d06eHDPt8lf42EAZZ5zqAe/55Xyxqeo7z0NH
	CJVEMmXwuAqVvdlw5DfV9GCWOUMBy+2cc3RpUqaNcqQ==
X-Received: by 2002:a05:6214:14f0:: with SMTP id
	k16mr9236620qvw.113.1572957919739; 
	Tue, 05 Nov 2019 04:45:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJTbZwdtHNPycBFd+QHSY5yg3vKqwKhqrT8dOiX4sn/dohfzJLFjj2/yAkWD2mznTYInGxUA==
X-Received: by 2002:a05:6214:14f0:: with SMTP id
	k16mr9236583qvw.113.1572957919303; 
	Tue, 05 Nov 2019 04:45:19 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
	by smtp.gmail.com with ESMTPSA id
	g25sm11907034qtc.90.2019.11.05.04.45.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 04:45:18 -0800 (PST)
Date: Tue, 5 Nov 2019 07:45:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH 1/2] IFC hardware operation layer
Message-ID: <20191105074309-mutt-send-email-mst@kernel.org>
References: <1572946660-26265-1-git-send-email-lingshan.zhu@intel.com>
	<1572946660-26265-2-git-send-email-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572946660-26265-2-git-send-email-lingshan.zhu@intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, jason.zeng@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Nov 05, 2019 at 05:37:39PM +0800, Zhu Lingshan wrote:
> This commit introduced ifcvf_base layer, which handles hardware
> operations and configurations.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  drivers/vhost/ifcvf/ifcvf_base.c | 344 +++++++++++++++++++++++++++++++++++++++
>  drivers/vhost/ifcvf/ifcvf_base.h | 132 +++++++++++++++
>  2 files changed, 476 insertions(+)
>  create mode 100644 drivers/vhost/ifcvf/ifcvf_base.c
>  create mode 100644 drivers/vhost/ifcvf/ifcvf_base.h
> 
> diff --git a/drivers/vhost/ifcvf/ifcvf_base.c b/drivers/vhost/ifcvf/ifcvf_base.c
> new file mode 100644
> index 0000000..0659f41
> --- /dev/null
> +++ b/drivers/vhost/ifcvf/ifcvf_base.c
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Intel Corporation.
> + */
> +
> +#include "ifcvf_base.h"
> +
> +static void *get_cap_addr(struct ifcvf_hw *hw, struct virtio_pci_cap *cap)
> +{
> +	struct ifcvf_adapter *ifcvf;
> +	u32 length, offset;
> +	u8 bar;
> +
> +	length = le32_to_cpu(cap->length);
> +	offset = le32_to_cpu(cap->offset);
> +	bar = le32_to_cpu(cap->bar);
> +
> +	ifcvf = container_of(hw, struct ifcvf_adapter, vf);
> +
> +	if (bar >= IFCVF_PCI_MAX_RESOURCE) {
> +		IFC_DBG(ifcvf->dev,
> +			"Invalid bar number %u to get capabilities.\n", bar);
> +		return NULL;
> +	}
> +
> +	if (offset + length < offset) {
> +		IFC_DBG(ifcvf->dev, "offset(%u) + length(%u) overflows\n",
> +			offset, length);
> +		return NULL;
> +	}
> +
> +	if (offset + length > hw->mem_resource[cap->bar].len) {
> +		IFC_DBG(ifcvf->dev,
> +			"offset(%u) + len(%u) overflows bar%u to get capabilities.\n",
> +			offset, length, bar);
> +		return NULL;
> +	}
> +
> +	return hw->mem_resource[bar].addr + offset;
> +}
> +
> +int ifcvf_read_config_range(struct pci_dev *dev,
> +			uint32_t *val, int size, int where)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < size; i += 4) {
> +		ret = pci_read_config_dword(dev, where + i, val + i / 4);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int ifcvf_init_hw(struct ifcvf_hw *hw, struct pci_dev *dev)
> +{
> +	struct virtio_pci_cap cap;
> +	u16 notify_off;
> +	int ret;
> +	u8 pos;
> +	u32 i;
> +
> +	ret = pci_read_config_byte(dev, PCI_CAPABILITY_LIST, &pos);
> +
> +	if (ret < 0) {
> +		IFC_ERR(&dev->dev, "Failed to read PCI capability list.\n");
> +		return -EIO;
> +	}
> +
> +	while (pos) {
> +		ret = ifcvf_read_config_range(dev, (u32 *)&cap,
> +					      sizeof(cap), pos);
> +
> +		if (ret < 0) {
> +			IFC_ERR(&dev->dev, "Failed to get PCI capability at %x",
> +				pos);
> +			break;
> +		}
> +
> +		if (cap.cap_vndr != PCI_CAP_ID_VNDR)
> +			goto next;
> +
> +		IFC_DBG(&dev->dev, "read PCI config: config type: %u, PCI bar: %u,\
> +			 PCI bar offset: %u, PCI config len: %u.\n",
> +			cap.cfg_type, cap.bar, cap.offset, cap.length);
> +
> +		switch (cap.cfg_type) {
> +		case VIRTIO_PCI_CAP_COMMON_CFG:
> +			hw->common_cfg = get_cap_addr(hw, &cap);
> +			IFC_INFO(&dev->dev, "hw->common_cfg = %p.\n",
> +				 hw->common_cfg);
> +			break;
> +		case VIRTIO_PCI_CAP_NOTIFY_CFG:
> +			pci_read_config_dword(dev, pos + sizeof(cap),
> +					      &hw->notify_off_multiplier);
> +			hw->notify_bar = cap.bar;
> +			hw->notify_base = get_cap_addr(hw, &cap);
> +			IFC_INFO(&dev->dev, "hw->notify_base = %p.\n",
> +				 hw->notify_base);
> +			break;
> +		case VIRTIO_PCI_CAP_ISR_CFG:
> +			hw->isr = get_cap_addr(hw, &cap);
> +			IFC_INFO(&dev->dev, "hw->isr = %p.\n", hw->isr);
> +			break;
> +		case VIRTIO_PCI_CAP_DEVICE_CFG:
> +			hw->net_cfg = get_cap_addr(hw, &cap);
> +			IFC_INFO(&dev->dev, "hw->net_cfg = %p.\n", hw->net_cfg);
> +			break;
> +		}
> +next:
> +		pos = cap.cap_next;
> +	}
> +
> +	if (hw->common_cfg == NULL || hw->notify_base == NULL ||
> +	    hw->isr == NULL || hw->net_cfg == NULL) {
> +		IFC_DBG(&dev->dev, "Incomplete PCI capabilities.\n");
> +		return -1;
> +	}
> +
> +	for (i = 0; i < IFCVF_MAX_QUEUE_PAIRS * 2; i++) {
> +		iowrite16(i, &hw->common_cfg->queue_select);
> +		notify_off = ioread16(&hw->common_cfg->queue_notify_off);
> +		hw->notify_addr[i] = (void *)((u8 *)hw->notify_base +
> +				     notify_off * hw->notify_off_multiplier);
> +	}
> +
> +	hw->lm_cfg = hw->mem_resource[IFCVF_LM_BAR].addr;
> +
> +	IFC_DBG(&dev->dev, "PCI capability mapping: common cfg: %p,\
> +		notify base: %p\n, isr cfg: %p, device cfg: %p,\
> +		multiplier: %u\n",
> +		hw->common_cfg, hw->notify_base, hw->isr,
> +		hw->net_cfg, hw->notify_off_multiplier);
> +
> +	return 0;
> +}
> +
> +u8 ifcvf_get_status(struct ifcvf_hw *hw)
> +{
> +	u8 old_gen, new_gen, status;
> +
> +	do {
> +		old_gen = ioread8(&hw->common_cfg->config_generation);
> +		status = ioread8(&hw->common_cfg->device_status);
> +		new_gen = ioread8(&hw->common_cfg->config_generation);
> +	} while (old_gen != new_gen);
> +
> +	return status;
> +}
> +
> +void ifcvf_set_status(struct ifcvf_hw *hw, u8 status)
> +{
> +	iowrite8(status, &hw->common_cfg->device_status);
> +}
> +
> +void ifcvf_reset(struct ifcvf_hw *hw)
> +{
> +	ifcvf_set_status(hw, 0);
> +	ifcvf_get_status(hw);
> +}
> +
> +static void ifcvf_add_status(struct ifcvf_hw *hw, u8 status)
> +{
> +	if (status != 0)
> +		status |= ifcvf_get_status(hw);
> +
> +	ifcvf_set_status(hw, status);
> +	ifcvf_get_status(hw);
> +}
> +
> +u64 ifcvf_get_features(struct ifcvf_hw *hw)
> +{
> +	struct virtio_pci_common_cfg *cfg = hw->common_cfg;
> +	u32 features_lo, features_hi;
> +
> +	iowrite32(0, &cfg->device_feature_select);
> +	features_lo = ioread32(&cfg->device_feature);
> +
> +	iowrite32(1, &cfg->device_feature_select);
> +	features_hi = ioread32(&cfg->device_feature);
> +
> +	return ((u64)features_hi << 32) | features_lo;
> +}
> +
> +void ifcvf_read_net_config(struct ifcvf_hw *hw, u64 offset,
> +		       void *dst, int length)
> +{
> +	u8 old_gen, new_gen, *p;
> +	int i;
> +
> +	WARN_ON(offset + length > sizeof (struct ifcvf_net_config));
> +
> +	do {
> +		old_gen = ioread8(&hw->common_cfg->config_generation);
> +		p = dst;
> +
> +		for (i = 0; i < length; i++)
> +			*p++ = ioread8((u8 *)hw->net_cfg + offset + i);
> +
> +		new_gen = ioread8(&hw->common_cfg->config_generation);
> +	} while (old_gen != new_gen);
> +}
> +
> +void ifcvf_write_net_config(struct ifcvf_hw *hw, u64 offset,
> +			    const void *src, int length)
> +{
> +	const u8 *p;
> +	int i;
> +
> +	p = src;
> +	WARN_ON(offset + length > sizeof (struct ifcvf_net_config));
> +
> +	for (i = 0; i < length; i++)
> +		iowrite8(*p++, (u8 *)hw->net_cfg + offset + i);
> +}
> +
> +static void ifcvf_set_features(struct ifcvf_hw *hw, u64 features)
> +{
> +	struct virtio_pci_common_cfg *cfg = hw->common_cfg;
> +
> +	iowrite32(0, &cfg->guest_feature_select);
> +	iowrite32(features & ((1ULL << 32) - 1), &cfg->guest_feature);
> +
> +	iowrite32(1, &cfg->guest_feature_select);
> +	iowrite32(features >> 32, &cfg->guest_feature);
> +}
> +
> +static int ifcvf_config_features(struct ifcvf_hw *hw)
> +{
> +	struct ifcvf_adapter *ifcvf;
> +
> +	ifcvf =	container_of(hw, struct ifcvf_adapter, vf);
> +	ifcvf_set_features(hw, hw->req_features);
> +	ifcvf_add_status(hw, VIRTIO_CONFIG_S_FEATURES_OK);
> +
> +	if (!(ifcvf_get_status(hw) & VIRTIO_CONFIG_S_FEATURES_OK)) {
> +		IFC_ERR(ifcvf->dev, "Failed to set FEATURES_OK status\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +void io_write64_twopart(u64 val, u32 *lo, u32 *hi)
> +{
> +	iowrite32(val & ((1ULL << 32) - 1), lo);
> +	iowrite32(val >> 32, hi);
> +}
> +
> +static int ifcvf_hw_enable(struct ifcvf_hw *hw)
> +{
> +	struct virtio_pci_common_cfg *cfg;
> +	struct ifcvf_adapter *ifcvf;
> +	u8 *lm_cfg;
> +	u32 i;
> +
> +	ifcvf = container_of(hw, struct ifcvf_adapter, vf);
> +	cfg = hw->common_cfg;
> +	lm_cfg = hw->lm_cfg;
> +	iowrite16(IFCVF_MSI_CONFIG_OFF, &cfg->msix_config);
> +
> +	if (ioread16(&cfg->msix_config) == VIRTIO_MSI_NO_VECTOR) {
> +		IFC_ERR(ifcvf->dev, "No msix vector for device config.\n");
> +		return -1;
> +	}
> +
> +	for (i = 0; i < hw->nr_vring; i++) {
> +		iowrite16(i, &cfg->queue_select);
> +		io_write64_twopart(hw->vring[i].desc, &cfg->queue_desc_lo,
> +				&cfg->queue_desc_hi);
> +		io_write64_twopart(hw->vring[i].avail, &cfg->queue_avail_lo,
> +				&cfg->queue_avail_hi);
> +		io_write64_twopart(hw->vring[i].used, &cfg->queue_used_lo,
> +				&cfg->queue_used_hi);
> +		iowrite16(hw->vring[i].size, &cfg->queue_size);
> +
> +		*(u32 *)(lm_cfg + IFCVF_LM_RING_STATE_OFFSET +
> +				(i / 2) * IFCVF_LM_CFG_SIZE + (i % 2) * 4) =
> +			(u32)hw->vring[i].last_avail_idx |
> +			((u32)hw->vring[i].last_used_idx << 16);
> +
> +		iowrite16(i + IFCVF_MSI_QUEUE_OFF, &cfg->queue_msix_vector);
> +		if (ioread16(&cfg->queue_msix_vector) ==
> +		    VIRTIO_MSI_NO_VECTOR) {
> +			IFC_ERR(ifcvf->dev,
> +				"No msix vector for queue %u.\n", i);
> +			return -1;
> +		}
> +
> +		iowrite16(1, &cfg->queue_enable);
> +	}
> +
> +	return 0;
> +}
> +
> +static void ifcvf_hw_disable(struct ifcvf_hw *hw)
> +{
> +	struct virtio_pci_common_cfg *cfg;
> +	u32 i;
> +
> +	cfg = hw->common_cfg;
> +	iowrite16(VIRTIO_MSI_NO_VECTOR, &cfg->msix_config);
> +
> +	for (i = 0; i < hw->nr_vring; i++) {
> +		iowrite16(i, &cfg->queue_select);
> +		iowrite16(0, &cfg->queue_enable);
> +		iowrite16(VIRTIO_MSI_NO_VECTOR, &cfg->queue_msix_vector);
> +	}
> +}
> +
> +int ifcvf_start_hw(struct ifcvf_hw *hw)
> +{
> +	ifcvf_reset(hw);
> +	ifcvf_add_status(hw, VIRTIO_CONFIG_S_ACKNOWLEDGE);
> +	ifcvf_add_status(hw, VIRTIO_CONFIG_S_DRIVER);
> +
> +	if (ifcvf_config_features(hw) < 0)
> +		return -1;
> +
> +	if (ifcvf_hw_enable(hw) < 0)
> +		return -1;
> +
> +	ifcvf_add_status(hw, VIRTIO_CONFIG_S_DRIVER_OK);
> +
> +	return 0;
> +}
> +
> +void ifcvf_stop_hw(struct ifcvf_hw *hw)
> +{
> +	ifcvf_hw_disable(hw);
> +	ifcvf_reset(hw);
> +}
> +
> +void ifcvf_notify_queue(struct ifcvf_hw *hw, u16 qid)
> +{
> +	iowrite16(qid, hw->notify_addr[qid]);
> +}
> +
> +u64 ifcvf_get_queue_notify_off(struct ifcvf_hw *hw, int qid)
> +{
> +	return (u8 *)hw->notify_addr[qid] -
> +		(u8 *)hw->mem_resource[hw->notify_bar].addr;
> +}
> diff --git a/drivers/vhost/ifcvf/ifcvf_base.h b/drivers/vhost/ifcvf/ifcvf_base.h
> new file mode 100644
> index 0000000..c97f0eb
> --- /dev/null
> +++ b/drivers/vhost/ifcvf/ifcvf_base.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2019 Intel Corporation.
> + */
> +
> +#ifndef _IFCVF_H_
> +#define _IFCVF_H_
> +
> +#include <linux/virtio_mdev_ops.h>
> +#include <linux/mdev.h>
> +#include <linux/pci.h>
> +#include <linux/pci_regs.h>
> +#include <uapi/linux/virtio_net.h>
> +#include <uapi/linux/virtio_config.h>
> +#include <uapi/linux/virtio_pci.h>
> +
> +#define IFCVF_VENDOR_ID         0x1AF4
> +#define IFCVF_DEVICE_ID         0x1041
> +#define IFCVF_SUBSYS_VENDOR_ID  0x8086
> +#define IFCVF_SUBSYS_DEVICE_ID  0x001A
> +
> +#define IFCVF_MDEV_LIMIT	1
> +
> +/*
> + * Some ifcvf feature bits (currently bits 28 through 31) are
> + * reserved for the transport being used (eg. ifcvf_ring), the
> + * rest are per-device feature bits.
> + */
> +#define IFCVF_TRANSPORT_F_START 28
> +#define IFCVF_TRANSPORT_F_END   34
> +
> +#define IFC_SUPPORTED_FEATURES \
> +		((1ULL << VIRTIO_NET_F_MAC)			| \
> +		 (1ULL << VIRTIO_F_ANY_LAYOUT)			| \
> +		 (1ULL << VIRTIO_F_VERSION_1)			| \
> +		 (1ULL << VIRTIO_F_ORDER_PLATFORM)			| \

ACCESS_PLATFORM must be enabled for sure?


> +		 (1ULL << VIRTIO_NET_F_GUEST_ANNOUNCE)		| \
> +		 (1ULL << VIRTIO_NET_F_CTRL_VQ)			| \
> +		 (1ULL << VIRTIO_NET_F_STATUS)			| \
> +		 (1ULL << VIRTIO_NET_F_MRG_RXBUF)) /* not fully supported */
> +
> +//Not support MQ, only one queue pair for now.
> +#define IFCVF_MAX_QUEUE_PAIRS		1
> +#define IFCVF_MAX_QUEUES		2
> +
> +#define IFCVF_QUEUE_ALIGNMENT		PAGE_SIZE
> +
> +#define IFCVF_MSI_CONFIG_OFF	0
> +#define IFCVF_MSI_QUEUE_OFF	1
> +#define IFCVF_PCI_MAX_RESOURCE	6
> +
> +#define IFCVF_LM_CFG_SIZE		0x40
> +#define IFCVF_LM_RING_STATE_OFFSET	0x20
> +#define IFCVF_LM_BAR	4
> +
> +#define IFCVF_32_BIT_MASK		0xffffffff
> +
> +#define IFC_ERR(dev, fmt, ...)	dev_err(dev, fmt, ##__VA_ARGS__)
> +#define IFC_DBG(dev, fmt, ...)	dev_dbg(dev, fmt, ##__VA_ARGS__)
> +#define IFC_INFO(dev, fmt, ...)	dev_info(dev, fmt, ##__VA_ARGS__)
> +
> +#define IFC_PRIVATE_TO_VF(adapter) \
> +	(&((struct ifcvf_adapter *)adapter)->vf)
> +
> +#define IFCVF_MAX_INTR (IFCVF_MAX_QUEUE_PAIRS * 2 + 1)
> +
> +struct ifcvf_net_config {
> +	u8    mac[6];
> +	u16   status;
> +	u16   max_virtqueue_pairs;
> +} __packed;
> +
> +struct ifcvf_pci_mem_resource {
> +	/* Physical address, 0 if not resource. */
> +	u64      phys_addr;
> +	/* Length of the resource. */
> +	u64      len;
> +	/* Virtual address, NULL when not mapped. */
> +	u8       *addr;
> +};
> +
> +struct vring_info {
> +	u64 desc;
> +	u64 avail;
> +	u64 used;
> +	u16 size;
> +	u16 last_avail_idx;
> +	u16 last_used_idx;
> +	bool ready;
> +	char msix_name[256];
> +	struct virtio_mdev_callback cb;
> +};
> +
> +struct ifcvf_hw {
> +	u8	*isr;
> +	u8	notify_bar;
> +	u8	*lm_cfg;
> +	u8	nr_vring;
> +	u16	*notify_base;
> +	u16	*notify_addr[IFCVF_MAX_QUEUE_PAIRS * 2];
> +	u32	notify_off_multiplier;
> +	u64	req_features;
> +	struct	virtio_pci_common_cfg *common_cfg;
> +	struct	ifcvf_net_config *net_cfg;
> +	struct	vring_info vring[IFCVF_MAX_QUEUE_PAIRS * 2];
> +	struct	ifcvf_pci_mem_resource mem_resource[IFCVF_PCI_MAX_RESOURCE];
> +};
> +
> +struct ifcvf_adapter {
> +	struct	device *dev;
> +	struct	mutex mdev_lock;
> +	int	mdev_count;
> +	int	vectors;
> +	struct	ifcvf_hw vf;
> +};
> +
> +int ifcvf_init_hw(struct ifcvf_hw *hw, struct pci_dev *dev);
> +int ifcvf_start_hw(struct ifcvf_hw *hw);
> +void ifcvf_stop_hw(struct ifcvf_hw *hw);
> +void ifcvf_notify_queue(struct ifcvf_hw *hw, u16 qid);
> +u8 ifcvf_get_linkstatus(struct ifcvf_hw *hw);
> +void ifcvf_read_net_config(struct ifcvf_hw *hw, u64 offset,
> +			   void *dst, int length);
> +void ifcvf_write_net_config(struct ifcvf_hw *hw, u64 offset,
> +			    const void *src, int length);
> +u8 ifcvf_get_status(struct ifcvf_hw *hw);
> +void ifcvf_set_status(struct ifcvf_hw *hw, u8 status);
> +void io_write64_twopart(u64 val, u32 *lo, u32 *hi);
> +void ifcvf_reset(struct ifcvf_hw *hw);
> +u64 ifcvf_get_features(struct ifcvf_hw *hw);
> +
> +#endif /* _IFCVF_H_ */
> -- 
> 1.8.3.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
