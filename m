Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8CE109316
	for <lists.virtualization@lfdr.de>; Mon, 25 Nov 2019 18:48:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F07D859BA;
	Mon, 25 Nov 2019 17:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNyQvuDnmSn9; Mon, 25 Nov 2019 17:48:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9217F859C1;
	Mon, 25 Nov 2019 17:48:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FD16C0881;
	Mon, 25 Nov 2019 17:48:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52BB0C0878
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 17:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 46FB98796C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 17:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y407xKzSxIKs
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 17:48:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 879928796D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 17:48:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i12so19193470wrn.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 09:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BgkOCn6dEkaCecb5ZyLmsM0vtVrRc/X2TTNPZzp0BGs=;
 b=avnCZcmnWQYRn2ejXtbreBr+2fzx+QirQ6jMfKAMwEDo3jyctcQvSS6SM6aBRJCAeP
 kfDeyJNKwf8Ww1fdC45IB/7jKdswYHhGPaF1CAK1k/eHulj1Z8NDM4NLugYgnTl5DEOo
 YefFZFkbA6n3NhXip9hDUOr85MJpTQj4qNSE9VQlJPLdQNIY7YvpyPpEkKFXnyOnZTKk
 zxPRxvEFW8WTSxxiqEYBqSc/EW+pCq8OXdDzqUhlOxxL17HZqZAjCdkw8lFuH7Nliyrm
 MDDF0iP1wW7sCg4O3wkJdWYO3+EHez48clfhcdiT/8bJ80T/RuVV1xpWQm7lYwPafspo
 67oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BgkOCn6dEkaCecb5ZyLmsM0vtVrRc/X2TTNPZzp0BGs=;
 b=suyMZIa3YXOIuiaIbCjQ3aeRpHsYI8bHxl3aE2ZI00ensRZeV9Lq/70OGvyD1DIced
 2zvL37J74kaMxlFX06n7GGIxmO83kJ2HPEcPnP8OcNKF9nnUxG3cm2aZHAMnJOnA8tWX
 Z1x8iMd+es0/BqNk0GLoG5wfFGisUPa9N1h649nVRSeQif2A5ngvbiyHBMWHS+O4IkBz
 eJZZHY+xcPNWPwKBlT9PfFdNBDtj42z0rZ9dlnbjZvLnZyCWtJHFEfsJY5D8GJQ4DHWz
 UrDDGmFo7B1BDUAbpbtn5f/PYY0mGKv5dVurWf2BQMC1j657pCwVyX8Ma6jq/zzA5oaY
 Q/bQ==
X-Gm-Message-State: APjAAAVHAor3X/igOoVscIdwIIWs2kUwWzggKgAw0+1x90mqkfKkcbhL
 qdiY8j7NQ7RSRc/tpP+rPdNEVg==
X-Google-Smtp-Source: APXvYqzTUYJqRjRrvNHNtPJwWI/KyemjW5baiqCvdsWHNGy9hgofkwoCe9NS+y/KmUwV3VIZ5E9NFQ==
X-Received: by 2002:a5d:4acb:: with SMTP id y11mr12150855wrs.106.1574704100857; 
 Mon, 25 Nov 2019 09:48:20 -0800 (PST)
Received: from lophozonia (xdsl-188-155-204-106.adslplus.ch. [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id x7sm11127238wrq.41.2019.11.25.09.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 09:48:20 -0800 (PST)
Date: Mon, 25 Nov 2019 18:48:17 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC 13/13] iommu/virtio: Add topology description to
Message-ID: <20191125174817.GB945122@lophozonia>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
 <20191122105000.800410-14-jean-philippe@linaro.org>
 <20191122072753-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122072753-mutt-send-email-mst@kernel.org>
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

On Fri, Nov 22, 2019 at 07:53:19AM -0500, Michael S. Tsirkin wrote:
> Overall this looks good to me. The only point is that
> I think the way the interface is designed makes writing
> the driver a bit too difficult. Idea: if instead we just
> have a length field and then an array of records
> (preferably unions so we don't need to work hard),
> we can shadow that into memory, then iterate over
> the unions.
> 
> Maybe add a uniform record length + number of records field.
> Then just skip types you do not know how to handle.
> This will also help make sure it's within bounds.
> 
> What do you think?

Sounds good, that should simplify the implementation a bit.

> You will need to do something to address the TODO I think.

Yes, I'll try to figure out a way to test platform devices.

> > +static void viommu_cwrite(struct pci_dev *dev, int cfg,
> > +			  struct viommu_cap_config *cap, u32 length, u32 offset,
> > +			  u32 val)
> 
> A single user with 4 byte parameter. Just open-code?

Ok

> > +		cap.head.type = viommu_cread(dev, pci_cfg, dev_cfg, 2, offset);
> > +		cap.head.next = viommu_cread(dev, pci_cfg, dev_cfg, 2, offset + 2);
> 
> All of this doesn't seem to be endian-clean. Try running sparse I think
> it will complain.

It does, I'll fix this

> > @@ -36,6 +37,31 @@ struct virtio_iommu_config {
> >  	struct virtio_iommu_range_32		domain_range;
> >  	/* Probe buffer size */
> >  	__le32					probe_size;
> > +	/* Offset to the beginning of the topology table */
> > +	__le16					topo_offset;
> 
> why do we need an offset?

I find it awkward to put a variable-size array in the middle of the
config. The virtio_iommu_config struct would be easier to extend later if
we keep the array at the end and only define small static fields here.

> 
> > +};
> > +
> > +struct virtio_iommu_topo_head {
> > +	__le16					type;
> > +	__le16					next;
> > +};
> 
> So this linked list makes things harder than necessary imho.
> It will be easier to just have a counter with # of records.
> Then make all records the same size.
> Then just read each record out into a buffer, and
> handle it there.

Yes, that should simplify things.

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
