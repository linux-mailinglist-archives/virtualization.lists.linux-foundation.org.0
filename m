Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04DD85B5
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 04:05:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 900A9C87;
	Wed, 16 Oct 2019 02:05:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 28925C7D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 02:05:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 570B314D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 02:05:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q12so13657591pff.9
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 19:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QC3gEZR1hPeoV9cErrVTRBwhQgxMJw1kOt/RcyP6C6w=;
	b=1w0IOtYfvSoz2t35HiCfmWEBG/6NZWQDRGyT9mxsztX6Py9Chwl0498ydNjJh0c//p
	/pUv8LxQNVibIrycGvKocjulsnsWN/vrTMaIcY1fIUvc31ZU4qCJbyuLdDBntXMOE97d
	CyZP6VcCp7aR21Vyf109i5U2fhry6UYaMZg/lPZnzoxThrZk2aILiB6YLGoeDlXfwUCp
	WZ55aOfZvtWNYwrk3OErtEE+rJS+BVioCM6nZOf2QnanyzFj9ftGRv/hZAkzpU6ZzsaG
	hnJoKhQL2U4Vq2icAfQqb45uaJqw1uM7uoNVkHL4LUEWI48WHdO77tRksqhZaU97DX4U
	8dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QC3gEZR1hPeoV9cErrVTRBwhQgxMJw1kOt/RcyP6C6w=;
	b=YkVJEfXHyEsN6rZuxk/OLuK4HYh4PkjMn+U7Va244vzLmNg639beI+2wX5gEuN5Ger
	1281cTazA08E8Xlt6HBXGzdN7bUoRY+nOqoN6tOXMrlD4DFKiMOr1IECh143kTuLwTqR
	0SfXREacueijECjawMU+0ivJCLXB21J4P1QVNYPHqUCFItPINlVLi84cF6uHRcycNo8T
	ZTOK2Vexo3K3gDMxQPCFOMcDen8dj0VssIR09Gly+GGofCMCbuscAZ+RTUQcUlqVFtko
	SPNfZMBNhqMBEsQzXdVV0O2trz8NkSOv3h+l5dhXKmduXHJToerJALGhTMlrQFskxwUJ
	sDlQ==
X-Gm-Message-State: APjAAAWFN9JWe6M4kVLMUbFgVQ2Cew/0/n1ziOg0kNhWl73K2uP+UUpu
	6kkMuxtqHR9YPU2K1qeX1Trq3A==
X-Google-Smtp-Source: APXvYqw/EikbC+SU1Dgo4BMgqr5G5Xrl3P4spbJU2PEsTCnZX+e9JRuffgAYMJbGXbmsMOTX3yMNyA==
X-Received: by 2002:a63:3c3:: with SMTP id 186mr22567709pgd.285.1571191502725; 
	Tue, 15 Oct 2019 19:05:02 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
	by smtp.gmail.com with ESMTPSA id
	16sm21264196pfn.35.2019.10.15.19.05.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Oct 2019 19:05:02 -0700 (PDT)
Date: Tue, 15 Oct 2019 19:04:55 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [RFC 1/2] vhost: IFC VF hardware operation layer
Message-ID: <20191015190455.0d79b836@hermes.lan>
In-Reply-To: <20191016010318.3199-2-lingshan.zhu@intel.com>
References: <20191016010318.3199-1-lingshan.zhu@intel.com>
	<20191016010318.3199-2-lingshan.zhu@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, zhiyuan.lv@intel.com,
	jason.zeng@intel.com
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

On Wed, 16 Oct 2019 09:03:17 +0800
Zhu Lingshan <lingshan.zhu@intel.com> wrote:

> +int ifcvf_init_hw(struct ifcvf_hw *hw, struct pci_dev *dev)
> +{
> +	int ret;
> +	u8 pos;
> +	struct virtio_pci_cap cap;
> +	u32 i;
> +	u16 notify_off;

For network code, the preferred declaration style is
reverse christmas tree.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
