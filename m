Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57C109322
	for <lists.virtualization@lfdr.de>; Mon, 25 Nov 2019 18:53:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3FCE7879FD;
	Mon, 25 Nov 2019 17:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGl7iWsAriWv; Mon, 25 Nov 2019 17:53:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5721B879A3;
	Mon, 25 Nov 2019 17:53:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38F94C0878;
	Mon, 25 Nov 2019 17:53:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA875C0878
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 17:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0C8386193
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 17:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bp04gCO4Shrd
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 17:53:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E0E448410C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 17:53:20 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n188so265249wme.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 09:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w762PFi0VU3n3eQDHHvKOAEXrmJ/fz15F0VMqWwRKbE=;
 b=ucHw3iITUddgxmI0WaTeJ03oRUG5uF8HifGtGA0su/1oL8KAd8AZXtYGuQKcpbum8e
 d6QnTIGwff7BVf7S6toPsGifytN5SktOO+ePb6YqXPtb6gYo3YNY4PxId/vuZoubQL3B
 HZEwCDCJkQy+orvI6z5xFNqQfTmQLH9SdLq2Q9e4wsRNaJ0SGNOa+RCVpbB12Hl8Og9f
 CXY6WHbjQ2/65OtfFrYy/fCeDjmmeVA24mCcyFcYoKY1qa9FXUzoMG82gzImz8jhXo5w
 bHyegwRNLGNDIEyqqMjAAXkzFtDrFlkTpk8MwFyhHzyAPZmSpbf+F2CL2BoPmWn8fWWF
 u01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w762PFi0VU3n3eQDHHvKOAEXrmJ/fz15F0VMqWwRKbE=;
 b=tf+eJFfcweV+r53rhtF5SpTmWrhXtdzDOpswl4Y5nZdExL1k3ZeabEt+gjnwOJEmfe
 UbbLQ98P5TtoFH6hP26d7EKI8okXBxZFeCwr3bO15kNXQGMeO0jAUuE8Qj+YQY5/Rpiu
 OM55Hkm4kE+GpXB3FX6rBgRWzj9Q4s69O8Uj22vXk67Vo34ACVyT6ihecVRENaBUYr0r
 9IcudqmvIMufWLwlY+VlEZ9psVyShgRXwuxkUDZ//+HvRMm155QpbDKUVr7cRYdm6rV7
 a1tBKHZyDIsO0f0TYMDKNfOzXGyfnzQSeZ3FAK8I39u6PoqLBdUSIPYi/v6zY4AGjwko
 kdQQ==
X-Gm-Message-State: APjAAAXBmX9ptrKoBhU2QSWMJTZ+2j+aAxtuuBB7/Tu3fCYaWAsEmRYA
 uy5PeXQhQmh/VdjTSJH16Tvrrg==
X-Google-Smtp-Source: APXvYqzAZYIvQKGmfaQYD5lQJqrthSCPdfwYB+f4khqntbOAs2pzi4zET6f0XPBxuKoaB6N7z3djFQ==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr98865wml.100.1574704399261;
 Mon, 25 Nov 2019 09:53:19 -0800 (PST)
Received: from lophozonia (xdsl-188-155-204-106.adslplus.ch. [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id p1sm26490wmc.38.2019.11.25.09.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 09:53:18 -0800 (PST)
Date: Mon, 25 Nov 2019 18:53:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC 00/13] virtio-iommu on non-devicetree platforms
Message-ID: <20191125175316.GC945122@lophozonia>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
 <20191122075438-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122075438-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: virtio-dev@lists.oasis-open.org, lorenzo.pieralisi@arm.com,
 gregkh@linuxfoundation.org, linux-pci@vger.kernel.org, joro@8bytes.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, eric.auger@redhat.com, guohanjun@huawei.com,
 bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Fri, Nov 22, 2019 at 08:00:46AM -0500, Michael S. Tsirkin wrote:
> > (2) In addition, there are some concerns about having virtio depend on
> >     ACPI or DT. Some hypervisors (Firecracker, QEMU microvm, kvmtool x86
> >     [1])
> 
> power?

In kvmtool it boot with device tree. It also doesn't need virtio-iommu I
think, since it has its own paravirtualized interface.

> > don't currently implement those methods.
> > 
> >     It was suggested to embed the topology description into the device.
> >     It can work, as demonstrated at the end of this RFC, with the
> >     following limitations:
> > 
> >     - The topology description must be read before any endpoint managed
> >       by the IOMMU is probed, and even before the virtio module is
> >       loaded. This RFC uses a PCI quirk to manually parse the virtio
> >       configuration. It assumes that all endpoints managed by the IOMMU
> >       are under this same PCI host.
> > 
> >     - I don't have a solution for the virtio-mmio transport at the
> >       moment, because I haven't had time to modify a host to test it. I
> >       think it could either use a notifier on the platform bus, or
> >       better, a new 'iommu' command-line argument to the virtio-mmio
> >       driver.
> 
> 	A notifier seems easier for users. What are the disadvantages of
> 	that?

For each device we have to check if it's virtio-mmio, then map the MMIO
resource and check the device type. Having a dedicated command-line
argument would be more efficient.

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
