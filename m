Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB9177814
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 15:00:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A0AF8586A;
	Tue,  3 Mar 2020 14:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyUMXAwNq6xb; Tue,  3 Mar 2020 14:00:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3259A84D11;
	Tue,  3 Mar 2020 14:00:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10473C013E;
	Tue,  3 Mar 2020 14:00:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D349C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 294F684D11
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqB8kTEJQVGG
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:00:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4DF0F84D0F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583244016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aa6HtSeh49MIF/xjAgoQ7EQau/N+kwzDq7RM+vAw+Uo=;
 b=idd0hF0HzLrt9N4JAL6p2MgfJHMl1rOYhQcnYk8y5kNu9jvhn9Bq42IGjoH0qmCBZfu56J
 Mu2GLx9fG+gSzuXywk6E1dmYPNKhNAWy8LaSaDuzo2qGMcS55fnjwXL1pCiLh2lflee+P5
 0IsPPknNIWIZ+/Bm9aZ9tRsurEaYiCg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-EcqP2BGWMOKU1KwuTMlbCw-1; Tue, 03 Mar 2020 09:00:12 -0500
X-MC-Unique: EcqP2BGWMOKU1KwuTMlbCw-1
Received: by mail-qt1-f200.google.com with SMTP id o9so2232690qtt.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Mar 2020 06:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aa6HtSeh49MIF/xjAgoQ7EQau/N+kwzDq7RM+vAw+Uo=;
 b=S1D04jSeIqx6yjG5A/IuXa0JO1g6OS/aEXO0x6727I+gai4R8jOPg0EK7ypQ8/lGpg
 Q/TXZShuZbAfOHRDwdWwzB+YSWaSa98cGVBtpgccPogc9wJ/xCuoICnpOjTuavRugttp
 zqVx7LDtdXWqG4kOaCmCNSd1MdMITeH/6MW0jaaDXgWrJ/2DOgdJQ4arNoxuIYyuwhui
 3zmt2lZzSO906vrM+cWWBoXOhrrHzVEIn4Ya0zybMcM4u9Ga2me/PsgpFSGxbAhf3RDf
 E5CYbd/ppMZaYRVLw4XufZ2FnOhajkHCCWwkHPCYlkFGUWOJN/NZpEMADa369NHLNCY+
 Ppdg==
X-Gm-Message-State: ANhLgQ3x+zYLRyZ7FDS8ypszV0NXIEHqiW3ovRRBTgc2kpikXWlyJZ61
 rfBSXDBjrNttNtvDq4bgwAqf21PUtmar2Z/OIFMTmvRGpTJylkL99TlWTjXfvtew2u84Vw5uVEg
 VvgJ/cm7JDOgSCXnJZyVX2L/R7GtlCrLJCH03F/CLBg==
X-Received: by 2002:ac8:1c7a:: with SMTP id j55mr4453357qtk.311.1583244012066; 
 Tue, 03 Mar 2020 06:00:12 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuZwadsAvkhUcJH4/W47LkbDsji9AWmjLQIpqUobhWh56z5UC579vb1nzWGmKUdc6OPFj59sQ==
X-Received: by 2002:ac8:1c7a:: with SMTP id j55mr4453330qtk.311.1583244011778; 
 Tue, 03 Mar 2020 06:00:11 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id j1sm9081095qtd.66.2020.03.03.06.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:00:10 -0800 (PST)
Date: Tue, 3 Mar 2020 09:00:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200303084753-mutt-send-email-mst@kernel.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200303130155.GA13185@8bytes.org>
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

On Tue, Mar 03, 2020 at 02:01:56PM +0100, Joerg Roedel wrote:
> Hi Eric,
> 
> On Tue, Mar 03, 2020 at 11:19:20AM +0100, Auger Eric wrote:
> > Michael has pushed this solution (putting the "configuration in the PCI
> > config space"), I think for those main reasons:
> > - ACPI may not be supported on some archs/hyps
> 
> But on those there is device-tree, right?

Not necessarily. E.g. some power systems have neither.
There are also systems looking to bypass ACPI e.g. for boot speed.


> > - the virtio-iommu is a PCIe device so binding should not need ACPI
> > description
> 
> The other x86 IOMMUs are PCI devices too and they definitly need a ACPI
> table to be configured.
> 
> > Another issue with ACPI integration is we have different flavours of
> > tables that exist: IORT, DMAR, IVRS
> 
> An integration with IORT might be the best, but if it is not possible
> ther can be a new table-type for Virtio-iommu. That would still follow
> platform best practices.
> 
> > x86 ACPI integration was suggested with IORT. But it seems ARM is
> > reluctant to extend IORT to support para-virtualized IOMMU. So the VIOT
> > was proposed as a different atternative in "[RFC 00/13] virtio-iommu on
> > non-devicetree platforms"
> > (https://patchwork.kernel.org/cover/11257727/). Proposing a table that
> > may be used by different vendors seems to be a challenging issue here.
> 
> Yeah, if I am reading that right this proposes a one-fits-all solution.
> That is not needed as the other x86 IOMMUs already have their tables
> defined and implemented. There is no need to change anything there.
> 
> > So even if the above solution does not look perfect, it looked a
> > sensible compromise given the above arguments. Please could you explain
> > what are the most compelling arguments against it?
> 
> It is a hack and should be avoided if at all possible.

That sentence doesn't really answer the question, does it?

> And defining an
> own ACPI table type seems very much possible.

Frankly with platform specific interfaces like ACPI, virtio-iommu is
much less compelling.  Describing topology as part of the device in a
way that is first, portable, and second, is a good fit for hypervisors,
is to me one of the main reasons virtio-iommu makes sense at all.

> 
> Regards,
> 
> 	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
