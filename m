Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7051C068E
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 21:34:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD94E8884C;
	Thu, 30 Apr 2020 19:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TPnv-HuKfL0; Thu, 30 Apr 2020 19:34:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E69688844;
	Thu, 30 Apr 2020 19:34:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2484DC016F;
	Thu, 30 Apr 2020 19:34:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA7A3C0889
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 19:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B1D8F88846
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 19:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeHLLg0JVjVF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 19:34:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BD44B88844
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 19:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588275273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sS8AddF4WlY4FM3AJEU8Vr5dd3INR3Y9YVDuw7T/d9Y=;
 b=OFrthTSTKLfH9cacWBIn9z3F2Mt2f1cXc86/kwmvWIS1H9FpO0UN5zNW0zoCTDC0QtRsBn
 gL8OOH74yRM4Mfkg8INaN2lmE0jOb2QdJgE+TFyPDJSNcgTEUrD0CJJ+1rrvhZuCJFTieZ
 +TB0BobY73CWC1P7Qj+uGn7ZT2w1MRE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-8nwXUcSjNQKoXaJJkPaSZw-1; Thu, 30 Apr 2020 15:34:29 -0400
X-MC-Unique: 8nwXUcSjNQKoXaJJkPaSZw-1
Received: by mail-wr1-f72.google.com with SMTP id r14so1562500wrn.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 12:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sS8AddF4WlY4FM3AJEU8Vr5dd3INR3Y9YVDuw7T/d9Y=;
 b=VGx08XnqIdO6O6RcYYe5PUmOFv21JxCtoK6CIVirCePv6O3KMa5nMVoCWIKlXXo/91
 v5cFcdHOu2tTl9ZofK79YndMnbllXaT7O2KU24vWSyZWnHy44sLWh8CMiQz5v8LZsP9G
 2EMnO+kMMt00dcbnPWl3wn0UGO3Q+DLVVJukR9YtZMXkid+e8EVvDb9S96vevrP8cYt6
 SZYpUvwb+7vfOkt7M6fOCHyI/p8sRsAOKX3nuOuJJknm2JuZq5srynEfHYP7d3aYtbmE
 /lZM/Bb3HBt/92TQj7CRUxxZKwpBpJGDVLcMURpnpPSBGs6M60sW6uPPn0iX8NzhdY3t
 Du3A==
X-Gm-Message-State: AGi0Pua7FyN9J6q9CyU5t0kngTxzIccwm6gz302xwa4/5PwuvoQWz1ds
 KWQROupKM6mZ3fwgCHywjO4MHxXd4/W4bgJ6qxYrcDun1ldezjCy8H3OzVCvh01zJR70d2gGrW6
 VOIGOZDmiDZ+xf3eOrYRCwT4vdoW3plihkMfQld9ZVQ==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr147544wmh.47.1588275268397;
 Thu, 30 Apr 2020 12:34:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypIErEi2OKs7eqnsETBaKuMVCIu+8B3dc0io3m7kIhj79uNOeJtHgco9xaP2TdUr4Pnz00osWA==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr147527wmh.47.1588275268199;
 Thu, 30 Apr 2020 12:34:28 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 n6sm831929wmc.28.2020.04.30.12.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:34:27 -0700 (PDT)
Date: Thu, 30 Apr 2020 15:34:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [RFC/PATCH 1/1] virtio: Introduce MMIO ops
Message-ID: <20200430152808-mutt-send-email-mst@kernel.org>
References: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
 <1588240976-10213-2-git-send-email-vatsa@codeaurora.org>
 <20200430101431.GD19932@willie-the-truck>
 <20200430103446.GH5097@quicinc.com>
 <20200430104149.GG19932@willie-the-truck>
 <20200430111156.GI5097@quicinc.com>
 <7bf8bffe-267b-6c66-86c9-40017d3ca4c2@siemens.com>
 <20200430133321.GC3204@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20200430133321.GC3204@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, Jan Kiszka <jan.kiszka@siemens.com>,
 christoffer.dall@arm.com, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, stefano.stabellini@xilinx.com,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 pratikp@codeaurora.org
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

On Thu, Apr 30, 2020 at 07:03:21PM +0530, Srivatsa Vaddagiri wrote:
> * Jan Kiszka <jan.kiszka@siemens.com> [2020-04-30 14:59:50]:
> 
> > >I believe ivshmem2_virtio requires hypervisor to support PCI device emulation
> > >(for life-cycle management of VMs), which our hypervisor may not support.

PCI is mostly just 2 registers. One sets the affected device, one the data to read/write.

> A
> > >simple shared memory and doorbell or message-queue based transport will work for
> > >us.
> > 
> > As written in our private conversation, a mapping of the ivshmem2 device
> > discovery to platform mechanism (device tree etc.) and maybe even the
> > register access for doorbell and life-cycle management to something
> > hypercall-like would be imaginable. What would count more from virtio
> > perspective is a common mapping on a shared memory transport.
> 
> Yes that sounds simpler for us.
> 
> > That said, I also warned about all the features that PCI already defined
> > (such as message-based interrupts) which you may have to add when going a
> > different way for the shared memory device.
> 
> Is it really required to present this shared memory as belonging to a PCI
> device?

But then you will go on and add MSI, and NUMA, and security, and and and ...

> I would expect the device-tree to indicate the presence of this shared
> memory region, which we should be able to present to ivshmem2 as shared memory
> region to use (along with some handles for doorbell or message queue use).
> 
> I understand the usefulness of modeling the shared memory as part of device so
> that hypervisor can send events related to peers going down or coming up. In our
> case, there will be other means to discover those events and avoiding this
> requirement on hypervisor (to emulate PCI) will simplify the solution for us.
> 
> Any idea when we can expect virtio over ivshmem2 to become available?!

Check out the virtio spec. Right at the beginning it states:

	These devices are
	found in virtual environments, yet by design they look like physical devices to the guest within
	the virtual machine - and this document treats them as such. This similarity allows the guest to
	use standard drivers and discovery mechanisms


> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
