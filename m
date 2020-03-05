Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0BB17A919
	for <lists.virtualization@lfdr.de>; Thu,  5 Mar 2020 16:43:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43CC28619E;
	Thu,  5 Mar 2020 15:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QM_Y0Rz2rRrv; Thu,  5 Mar 2020 15:43:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D01C286194;
	Thu,  5 Mar 2020 15:43:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB195C013E;
	Thu,  5 Mar 2020 15:43:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE07BC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C10E92152A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gE0LOp5Y157f
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:43:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id A56642002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583422982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v5mw+5LGP9RE5YEazC7GDzkU8nm5NgoMOCIQaMpmC7k=;
 b=BFZ1EMhJ6V5lGIVZHN6rRRiHinm2TXnuWC9ISERNQHioK1ms2f6nZH07yFqkY4XASYJONQ
 5EiR7xtxkq868Xes4GT4HN0ieimFG12iwNtPEf5VMI1C4z/oRqf1BEmD+SzgxHKoSlIRQo
 e4hEDdWGz6V1AxXReImYVHLtTZr8Rok=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-3XyBtToNMr62k_9CWE9oZw-1; Thu, 05 Mar 2020 10:42:59 -0500
X-MC-Unique: 3XyBtToNMr62k_9CWE9oZw-1
Received: by mail-qv1-f69.google.com with SMTP id r16so3256198qvp.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 05 Mar 2020 07:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v5mw+5LGP9RE5YEazC7GDzkU8nm5NgoMOCIQaMpmC7k=;
 b=mkuzzTvUEPbWwmK43RWjo6up3efnuR+KMD2gY4bAyhmp/+qE7LRC8DYP6odRb1Lv85
 HdkVCCglzTWGl8kM6d5xpWJEBdtwiYo6woKT9aIbcGngZrex+3X1XCmBpVnizvp6X3qn
 VenlP96t0HRncG50Laseqei30oLPFVvMSusBRMloatqrGlRszNVeDfYhFWl3FBkaosId
 +12F8CHRrfNBXElNAFnasnC0p2XE1q5w0sQUWm+Zxw/rTvdU+OLKf7wROyoIOV3oauCj
 73Kf1tq6b8iVRd7u7PTTlzkK7/Q9VAzB5K7O8fIA7Pfc/XvYXoqHpEAtPDDP1xUUJmJi
 IG/Q==
X-Gm-Message-State: ANhLgQ3O2yP83ftsZVpNwOKyXMj5lR86ePxH536Kft8lawmbM1sYW6ir
 +Ctr/sFwgYIhOkjGJ346HE8SZ64q9xOdzVvcf1cc92oGgwNXLYlgx/Q+aWHRRE9hysmhsPXjjES
 XRVM7yXbuDhywRyXjWGzvjErijvOEVjQ9qX1iOa2XgQ==
X-Received: by 2002:a05:6214:1404:: with SMTP id
 n4mr6985873qvx.237.1583422978683; 
 Thu, 05 Mar 2020 07:42:58 -0800 (PST)
X-Google-Smtp-Source: ADFU+vupwTlYbbOVLm7I6MzJJZnvoKTQidVVSGtwHtFKHWgU4GKKZRAi3AoaWmSSz3B5Prm1w8y2nQ==
X-Received: by 2002:a05:6214:1404:: with SMTP id
 n4mr6985848qvx.237.1583422978417; 
 Thu, 05 Mar 2020 07:42:58 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id n8sm15851215qke.37.2020.03.05.07.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 07:42:57 -0800 (PST)
Date: Thu, 5 Mar 2020 10:42:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200305104002-mutt-send-email-mst@kernel.org>
References: <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
 <20200303084753-mutt-send-email-mst@kernel.org>
 <20200303155318.GA3954@8bytes.org>
 <20200303105523-mutt-send-email-mst@kernel.org>
 <20200304133707.GB4177@8bytes.org> <20200304153821.GE646000@myrica>
 <20200304174045.GC3315@8bytes.org>
 <20200304133744.00000fdb@intel.com>
 <20200304215449.GE3315@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200304215449.GE3315@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Rothman,
 Michael A" <michael.a.rothman@intel.com>, linux-pci@vger.kernel.org, "Kaneda,
 Erik" <erik.kaneda@intel.com>, virtualization@lists.linux-foundation.org,
 Auger Eric <eric.auger@redhat.com>, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, "Jacob Pan \(Jun\)" <jacob.jun.pan@intel.com>,
 bhelgaas@google.com, robin.murphy@arm.com
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

On Wed, Mar 04, 2020 at 10:54:49PM +0100, Joerg Roedel wrote:
> On Wed, Mar 04, 2020 at 01:37:44PM -0800, Jacob Pan (Jun) wrote:
> > + Mike and Erik who work closely on UEFI and ACPICA.
> > 
> > Copy paste Erik's initial response below on how to get a new table,
> > seems to confirm with the process you stated above.
> > 
> > "Fairly easy. You reserve a 4-letter symbol by sending a message
> > requesting to reserve the signature to Mike or the ASWG mailing list or
> > info@acpi.info
> 
> Great! I think this is going to be the path forward here.
> 
> Regards,
> 
> 	Joerg

I don't, I don't see why we should bother with ACPI. This is a PV device
anyway, we can just make it self-describing. The need for extra firmware
on some platforms is a bug not a feature. No point in emulating that.

> > 
> > There is also another option. You can have ASWG own this new table so
> > that not one entity or company owns the new table."

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
