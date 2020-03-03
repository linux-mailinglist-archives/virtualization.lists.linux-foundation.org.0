Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A2147177B9B
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 17:10:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E024720502;
	Tue,  3 Mar 2020 16:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ys+iMT8xY6UM; Tue,  3 Mar 2020 16:09:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2076220507;
	Tue,  3 Mar 2020 16:09:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFA12C07FF;
	Tue,  3 Mar 2020 16:09:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E983BC013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 16:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E1D0686430
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 16:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAP9OmWaTukw
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 16:09:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7A7E286388
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583251792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wKvfdiF15fmxVLHPj5o9eKPjxoX2xTKxmfQEHSXHh40=;
 b=deULHPUqa3b9V+UQI0RX9JIN3bRwwGbXpW+HdJWnOuqYoSaxdSQT8V1XkxnFPhgmLpLtHL
 bNNJocpHdW+aiOd8SjjSQWAfijDLZ1W4Kv6qcyXl3TEkJFK75bRD4rIuXoLkCa8ZB7U64K
 OrbvJgE7w4Ewrd8nbM3/LtNV8Q9QxTA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-CGy33bjnMs-5mJ14OYW9Fg-1; Tue, 03 Mar 2020 11:09:50 -0500
X-MC-Unique: CGy33bjnMs-5mJ14OYW9Fg-1
Received: by mail-qk1-f198.google.com with SMTP id q123so2476142qkb.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Mar 2020 08:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wKvfdiF15fmxVLHPj5o9eKPjxoX2xTKxmfQEHSXHh40=;
 b=abNNitFfC2MBQioDkzyoufDmvX+EeI0xT9WOivTEwpceMk0oBM9SnifR69VBXbPL/v
 7gg0IR8aI1U5QgWUX5wM8K/s17v1RtrFz6fHhpl7QIa3JnoQEStxUui85bLXF0Ez1nMO
 jBInykThEkZedpnlw8xItQPbJIYQYXWQTP8lxUKPLtWyeDTr9aEc0de8DI9jNemTQdEp
 9iiHqBSoItn5XKM8lPUTaD4vOCDeKltV4VGSJJkBpGzX1Q3A6e+RN8MyXQDq4EMcSWoT
 Fxqs8bRRu0QStYzlOlbfFNk2d8Z2D68ErB+wQrh+sc/Ac8CK2MHiVGEVKQhpIftuJOoE
 dJkg==
X-Gm-Message-State: ANhLgQ19+BQL4BHPODBjgyLiSCJyjmVbONOzi8ZXjK/GZ6Jigm/tGvLg
 mNc7sUiwf8anMuEVWSGjV8Li4Dcvxo9X0yqJYAiP7t37OQeR1t7v1isALuFcHcNfmuITftBRoaM
 DPpB0wxQvXfzYc5p2WtKweN7Ngj9NXSANWRXqgewmMA==
X-Received: by 2002:a05:6214:17c5:: with SMTP id
 cu5mr4424132qvb.210.1583251788242; 
 Tue, 03 Mar 2020 08:09:48 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtJ9GIyZMaGCJIKTXUVP5hZCrw/gJ9Guh3JYChqVs+dNQ8M4rE5nkP++m1WK1jniaFYOb8e4Q==
X-Received: by 2002:a05:6214:17c5:: with SMTP id
 cu5mr4424097qvb.210.1583251787954; 
 Tue, 03 Mar 2020 08:09:47 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id x34sm8269204qta.82.2020.03.03.08.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 08:09:47 -0800 (PST)
Date: Tue, 3 Mar 2020 11:09:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200303105523-mutt-send-email-mst@kernel.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
 <20200303084753-mutt-send-email-mst@kernel.org>
 <20200303155318.GA3954@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200303155318.GA3954@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Auger Eric <eric.auger@redhat.com>,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, bhelgaas@google.com, robin.murphy@arm.com
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

On Tue, Mar 03, 2020 at 04:53:19PM +0100, Joerg Roedel wrote:
> On Tue, Mar 03, 2020 at 09:00:05AM -0500, Michael S. Tsirkin wrote:
> > Not necessarily. E.g. some power systems have neither.
> > There are also systems looking to bypass ACPI e.g. for boot speed.
> 
> If there is no firmware layer between the hardware and the OS the
> necessary information the OS needs to run on the hardware is probably
> hard-coded into the kernel?

No. It's coded into the hardware. Which might even be practical
for bare-metal (e.g. on-board flash), but is very practical
when the device is part of a hypervisor.

> In that case the same can be done with
> virtio-iommu tolopology.
> 
> > That sentence doesn't really answer the question, does it?
> 
> To be more elaborate, putting this information into config space is a
> layering violation. Hardware is never completly self-descriptive


This "hardware" is actually part of hypervisor so there's no
reason it can't be completely self-descriptive. It's specified
by the same entity as the "firmware".


> and
> that is why there is the firmware which provides the information about
> the hardware to the OS in a generic way.
>
> > Frankly with platform specific interfaces like ACPI, virtio-iommu is
> > much less compelling.  Describing topology as part of the device in a
> > way that is first, portable, and second, is a good fit for hypervisors,
> > is to me one of the main reasons virtio-iommu makes sense at all.
> 
> Virtio-IOMMU makes sense in the first place because it is much faster
> than emulating one of the hardware IOMMUs.

I don't see why it would be much faster. The interface isn't that
different from command queues of VTD.

> And an ACPI table is also
> portable to all ACPI platforms, same with device-tree.
> 
> Regards,
> 
> 	Joerg

Making ACPI meet the goals of embedded projects such as kata containers
would be a gigantic task with huge stability implications.  By
comparison this 400-line parser is well contained and does the job.  I
didn't yet see compelling reasons not to merge this, but I'll be
interested to see some more specific concerns.


-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
