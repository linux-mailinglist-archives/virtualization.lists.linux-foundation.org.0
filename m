Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 32043109338
	for <lists.virtualization@lfdr.de>; Mon, 25 Nov 2019 19:02:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 35637843BB;
	Mon, 25 Nov 2019 18:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZRpHQGGXhoJ; Mon, 25 Nov 2019 18:02:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCB6B83AE3;
	Mon, 25 Nov 2019 18:02:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBC0AC0878;
	Mon, 25 Nov 2019 18:02:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E4E4C0878
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 18:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0AA03844C7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 18:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3cHYLSykt17E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 18:02:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8FF6184496
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 18:02:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so277324wmc.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 10:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DsVFgOaoUnvqgpXrrfO/kuxApZChsstp982wmsPwKow=;
 b=BVZoTiVVWzkDa6J2Q2Qlyztkv9vYFsD8IQFSzj6F/veUx4CwkaYyPnMFRUYWaN8vy4
 FN/26iKAp68el7tDKgZOR8bbr3gZQ+IIjxSCIbCU3xYwtaRnVItBvJtOT5eD0zVON6uG
 /vdQ+r1fFJyFa5adDPjnZxlevY/yeOnNxUybX639YiR7WofyJKBI4nK48UtjD0iVidNm
 6GJ9ITcStA6id5xJFVLJHZv6Lax/OfEErhFa/2G/Ceczqd2xJ8z/NNb+5Zv+8SmMkZFv
 HaZyLOMDnD+07/EQFr1qxCxir+RJwAnSaMeHJgSUMK3rZ0osaPrGXBCwdtx82UlEbUCw
 EIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DsVFgOaoUnvqgpXrrfO/kuxApZChsstp982wmsPwKow=;
 b=lglIVzFdEWxGW9NWI0TMahBt+hzpyRbxJWeaeRFqoqn5rTJ56DNstJOQpAAUmyhmh4
 x+ld0L9laqXBrvtwh5bgFYKAfYgJBHXH+AOi7b8DRNWMJiI+HJkjPJxmw7DxhCPkXF8H
 /1jb7um5OKcOs9IVHlCbUMCIezf5Lm2q+D7v0T8FgngxrfaLhkkmK7vYq5GRR0jGRN2Z
 YSzlrCDK+AOa/ue0P2vbVuoDq8kTg8Laskap5QS2VFZutgcEtLkYXltDG6M4178GO/J0
 qfa2NByiptsy/RfKiYCh2Yl4uG/YZKd/kH9AvIgUoPMFuxK/lJNmodTa2jj3ZTX3lKqf
 bCSw==
X-Gm-Message-State: APjAAAU8/kO8fCBq3IgWuR9g3eOLUIlfmPJ4E0Grhr1g0qqMJzgGuNK7
 15Q5aa/JoLuaP2i6/fjEI2ArKQ==
X-Google-Smtp-Source: APXvYqw9M5aeYuFnK4VC6ZcTBEX4VkbAMP2hH5YfKViShTZm/FHN5Dr4VO7dByhvs7N0wxzK+UaojA==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr93685wmj.127.1574704970043;
 Mon, 25 Nov 2019 10:02:50 -0800 (PST)
Received: from lophozonia (xdsl-188-155-204-106.adslplus.ch. [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id 72sm11785825wrl.73.2019.11.25.10.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 10:02:49 -0800 (PST)
Date: Mon, 25 Nov 2019 19:02:47 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Jacob Pan (Jun)" <jacob.jun.pan@intel.com>
Subject: Re: [RFC 00/13] virtio-iommu on non-devicetree platforms
Message-ID: <20191125180247.GD945122@lophozonia>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
 <20191122160102.00004489@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122160102.00004489@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: virtio-dev@lists.oasis-open.org, lorenzo.pieralisi@arm.com,
 gregkh@linuxfoundation.org, linux-pci@vger.kernel.org, joro@8bytes.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com, mst@redhat.com,
 eric.auger@redhat.com, guohanjun@huawei.com, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Fri, Nov 22, 2019 at 04:01:02PM -0800, Jacob Pan (Jun) wrote:
> > (1) ACPI has one table per vendor (DMAR for Intel, IVRS for AMD and
> > IORT for Arm). From my point of view IORT is easier to extend, since
> > we just need to introduce a new node type. There are no dependencies
> > to Arm in the Linux IORT driver, so it works well with CONFIG_X86.
> > 
> From my limited understanding, IORT and VIOT is to solve device topology
> enumeration only? I am not sure how it can be expanded to cover
> information beyond device topology. e.g. DMAR has NUMA information and
> root port ATS, I guess they are not used today in the guest but might
> be additions in the future.

The PCI root-complex node of IORT has an ATS attribute, which we can
already use. However its scope is the root complex, not individual root
ports like with DMAR.

I'm not very familiar with NUMA, but it looks like we just need to specify
a proximity domain in relation to the SRAT table, for each viommu? The
SMMUv3 node in IORT has a 4-bytes "proximity domain" field for this. We
can add the same to the VIOT virtio-iommu nodes later, since the
structures are extensible.

But it might be better to keep the bare minimum information in the FW
descriptor, and put the rest in the virtio-iommu. So yes topology
enumeration is something the device cannot do itself (not fully that is,
see (2)) but for the rest, virtio-iommu's PROBE request can provide
details about each endpoint in relation to their physical IOMMU.

We could for example add a bit in a PROBE property saying that the whole
path between the IOMMU and the endpoint supports ATS. For NUMA it might
also be more interesting to have a finer granularity, since one viommu
could be managing endpoints that are behind different physical IOMMUs. If
in the future we want to allocate page tables close to the physical IOMMU
for example, we might need to describe multiple NUMA nodes per viommu,
using the PROBE request.

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
