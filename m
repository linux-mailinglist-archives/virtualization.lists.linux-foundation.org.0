Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D927CDC44
	for <lists.virtualization@lfdr.de>; Wed, 18 Oct 2023 14:52:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 714594037C;
	Wed, 18 Oct 2023 12:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714594037C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BDarZphf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fx8blL4qr92k; Wed, 18 Oct 2023 12:52:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 87615402F6;
	Wed, 18 Oct 2023 12:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87615402F6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC73EC008C;
	Wed, 18 Oct 2023 12:52:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 598F2C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 12:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 208BC4037C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 12:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 208BC4037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVwPR-BE1dt4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 12:51:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CD49402F6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 12:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD49402F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697633516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1O+/2owa5fju7g4/U4PJiwL7dSPmfofgEFgCR3W+zek=;
 b=BDarZphfZdrSz2z1l/noWZgZuX122tPeC2cWmjXLS64jt7E6HWvirXJo0CZTXph6rplIDY
 fe2rAv7FGzLhutO8P6MEo04r3ID5APr8rFrxZj6gmwNLvb29S7e/mVmmJ8PhHaTyaOag4g
 2h4W0HpWvKaQnITF9Sg3Mvo469MEnZo=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-yd3juCckO_CHjQYf_ij32Q-1; Wed, 18 Oct 2023 08:51:55 -0400
X-MC-Unique: yd3juCckO_CHjQYf_ij32Q-1
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-79fc1c4948aso517809939f.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 05:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697633514; x=1698238314;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1O+/2owa5fju7g4/U4PJiwL7dSPmfofgEFgCR3W+zek=;
 b=NSlbAUDkqKlYTMoEDR2RHNtcO1siBr5v1Tc8BpWj+uB0aoawoHYTe22GOB6mkaERo5
 JogTQyiVeCVZq9Shlg3gLUj8DJZMRiQ0NR2fiJVCTsApPDoreC+MTZ2B1/H3XlltNacr
 W3hCIQl0hyEyYB6RXlrh4lqMZ/AwXvruJiWubHS/+7RHdyMBv534cbw1V+7FVOAqIgm3
 n1INqCg/Fw9vOgtOOPxFNp9zCCyrA28hAPYZh0zaszU324cAnvyAgGahdoWFDNVfEESi
 lWUiQaPbhH5uv+b846TAYpTbl3EvP3NAcX3M4BsRnXyzbMqp94QtzNLFuE782w+lceDi
 zFzQ==
X-Gm-Message-State: AOJu0YxBU5E1duSibTeOq8p6S0CvabEO5fSV4LH7hurMrTwskKu5mIcm
 U/zsbjehjGzpp90ON6JtYYBvWJ6zIMgUzqhNsOVA73hfzyjvmY3MbCJfsGauc/+CEarED9mDzKk
 AZpmXKgh6jf+d+woLMzcZNsUi4qEubnTdXwagUQIDXQ==
X-Received: by 2002:a05:6602:2d84:b0:7a5:a391:73ae with SMTP id
 k4-20020a0566022d8400b007a5a39173aemr6528407iow.17.1697633514201; 
 Wed, 18 Oct 2023 05:51:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRH+kUg5NIUrWgXNmdt12UdPuElVEnxJGaEhQRXqfEVuIRCXKrb+d01Jr6pDdRbiFWRwcnmw==
X-Received: by 2002:a05:6602:2d84:b0:7a5:a391:73ae with SMTP id
 k4-20020a0566022d8400b007a5a39173aemr6528379iow.17.1697633513797; 
 Wed, 18 Oct 2023 05:51:53 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 r11-20020a02c84b000000b0042bb296863asm1148997jao.56.2023.10.18.05.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 05:51:53 -0700 (PDT)
Date: Wed, 18 Oct 2023 06:51:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH V1 vfio 9/9] vfio/virtio: Introduce a vfio driver over
 virtio devices
Message-ID: <20231018065151.39ee962d.alex.williamson@redhat.com>
In-Reply-To: <f6168335-d5e1-00ec-13ba-8c9a174b7eb0@nvidia.com>
References: <20231017134217.82497-1-yishaih@nvidia.com>
 <20231017134217.82497-10-yishaih@nvidia.com>
 <20231017142448.08673cdc.alex.williamson@redhat.com>
 <f6168335-d5e1-00ec-13ba-8c9a174b7eb0@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, mst@redhat.com, maorg@nvidia.com,
 virtualization@lists.linux-foundation.org, Jason Gunthorpe <jgg@nvidia.com>,
 jiri@nvidia.com, leonro@nvidia.com
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

On Wed, 18 Oct 2023 12:01:57 +0300
Yishai Hadas <yishaih@nvidia.com> wrote:

> On 17/10/2023 23:24, Alex Williamson wrote:
> > On Tue, 17 Oct 2023 16:42:17 +0300
> > Yishai Hadas <yishaih@nvidia.com> wrote:  
> >> +static int virtiovf_pci_probe(struct pci_dev *pdev,
> >> +			      const struct pci_device_id *id)
> >> +{
> >> +	const struct vfio_device_ops *ops = &virtiovf_acc_vfio_pci_ops;
> >> +	struct virtiovf_pci_core_device *virtvdev;
> >> +	int ret;
> >> +
> >> +	if (pdev->is_virtfn && virtiovf_support_legacy_access(pdev) &&
> >> +	    !virtiovf_bar0_exists(pdev) && pdev->msix_cap)
> >> +		ops = &virtiovf_acc_vfio_pci_tran_ops;  
> >
> > This is still an issue for me, it's a very narrow use case where we
> > have a modern device and want to enable legacy support.  Implementing an
> > IO BAR and mangling the device ID seems like it should be an opt-in,
> > not standard behavior for any compatible device.  Users should
> > generally expect that the device they see in the host is the device
> > they see in the guest.  They might even rely on that principle.  
> 
> Users here mainly refer to cloud operators.
> 
> We may assume, I believe, that they will be fine with seeing a 
> transitional device in the guest as they would like to get the legacy IO 
> support for their system.
> 
> However, we can still consider supplying a configuration knob in the 
> device layer (e.g. in the DPU side) to let a cloud operator turning off 
> the legacy capability.

This is a driver that implements to the virtio standard, so I don't see
how we can assume that the current use case is the only use case we'll
ever see.  Therefore we cannot assume this will only be consumed by a
specific cloud operator making use of NVIDIA hardware.  Other vendors
may implement this spec for other environments.  We might even see an
implementation of a virtual virtio-net device with SR-IOV.

> In that case upon probe() of the vfio-virtio driver, we'll just pick-up 
> the default vfio-pci 'ops' and in the guest we may have the same device 
> ID as of in the host.
> 
> With that approach we may not require a HOST side control (i.e. sysfs, 
> etc.), but stay with a s device control based on its user manual.
> 
> At the end, we don't expect any functional issue nor any compatible 
> problem with the new driver, both modern and legacy drivers can work in 
> the guest.
> 
> Can that work for you ?

This is not being proposed as an NVIDIA specific driver, we can't make
such claims relative to all foreseeable implementations of virtio-net.

> > We can't use the argument that users wanting the default device should
> > use vfio-pci rather than virtio-vfio-pci because we've already defined
> > the algorithm by which libvirt should choose a variant driver for a
> > device.  libvirt will choose this driver for all virtio-net devices.
> >
> > This driver effectively has the option to expose two different profiles
> > for the device, native or transitional.  We've discussed profile
> > support for variant drivers previously as an equivalent functionality
> > to mdev types, but the only use case for this currently is out-of-tree.
> > I think this might be the opportunity to define how device profiles are
> > exposed and selected in a variant driver.
> >
> > Jason had previously suggested a devlink interface for this, but I
> > understand that path had been shot down by devlink developers.  Another
> > obvious option is sysfs, where we might imagine an optional "profiles"
> > directory, perhaps under vfio-dev.  Attributes of "available" and
> > "current" could allow discovery and selection of a profile similar to
> > mdev types.  
> 
> Referring to the sysfs option,
> 
> Do you expect the sysfs data to effect the libvirt decision ? may that 
> require changes in libvirt ?

We don't have such changes in libvirt for mdev, other than the ability
of the nodedev information to return available type information.
Generally the mdev type is configured outside of libvirt, which falls
into the same sort of configuration as necessary to enable migration on
mlx5-vfio-pci.

It's possible we could allows a default profile which would be used if
the open_device callback is used without setting a profile, but we need
to be careful of vGPU use cases where profiles consume resources and a
default selection may affect other devices.

> In addition,
> May that be too late as the sysfs entry will be created upon driver 
> binding by libvirt or that we have in mind some other option to control 
> with that ?

No different than mlx5-vfio-pci, there's a necessary point between
binding the driver and using the device where configuration is needed.

> Jason,
> Can you please comment here as well ?
> 
> > Is this where we should head with this or are there other options to
> > confine this transitional behavior?
> >
> > BTW, what is "acc" in virtiovf_acc_vfio_pci_ops?  
> 
> "acc" is just a short-cut to "access", see also here[1] a similar usage.
> 
> [1] 
> https://elixir.bootlin.com/linux/v6.6-rc6/source/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c#L1380

Per the Kconfig:

	  This provides generic PCI support for HiSilicon ACC devices
	  using the VFIO framework.

Therefore I understood acc in this use case to be a formal reference to
the controller name.

> >> +
> >> +	virtvdev = vfio_alloc_device(virtiovf_pci_core_device, core_device.vdev,
> >> +				     &pdev->dev, ops);
> >> +	if (IS_ERR(virtvdev))
> >> +		return PTR_ERR(virtvdev);
> >> +
> >> +	dev_set_drvdata(&pdev->dev, &virtvdev->core_device);
> >> +	ret = vfio_pci_core_register_device(&virtvdev->core_device);
> >> +	if (ret)
> >> +		goto out;
> >> +	return 0;
> >> +out:
> >> +	vfio_put_device(&virtvdev->core_device.vdev);
> >> +	return ret;
> >> +}
> >> +
> >> +static void virtiovf_pci_remove(struct pci_dev *pdev)
> >> +{
> >> +	struct virtiovf_pci_core_device *virtvdev = dev_get_drvdata(&pdev->dev);
> >> +
> >> +	vfio_pci_core_unregister_device(&virtvdev->core_device);
> >> +	vfio_put_device(&virtvdev->core_device.vdev);
> >> +}
> >> +
> >> +static const struct pci_device_id virtiovf_pci_table[] = {
> >> +	/* Only virtio-net is supported/tested so far */
> >> +	{ PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_REDHAT_QUMRANET, 0x1041) },
> >> +	{}
> >> +};
> >> +
> >> +MODULE_DEVICE_TABLE(pci, virtiovf_pci_table);
> >> +
> >> +static struct pci_driver virtiovf_pci_driver = {
> >> +	.name = KBUILD_MODNAME,
> >> +	.id_table = virtiovf_pci_table,
> >> +	.probe = virtiovf_pci_probe,
> >> +	.remove = virtiovf_pci_remove,
> >> +	.err_handler = &vfio_pci_core_err_handlers,
> >> +	.driver_managed_dma = true,
> >> +};
> >> +
> >> +module_pci_driver(virtiovf_pci_driver);
> >> +
> >> +MODULE_LICENSE("GPL");
> >> +MODULE_AUTHOR("Yishai Hadas <yishaih@nvidia.com>");
> >> +MODULE_DESCRIPTION(
> >> +	"VIRTIO VFIO PCI - User Level meta-driver for VIRTIO device family");  
> > Not yet "family" per the device table.  Thanks,  
> 
> Right
> 
> How about dropping the word "family" and say instead ".. for VIRTIO 
> devices" as we have in the Kconfig in that patch [1] ?
> 
> [1] "This provides support for exposing VIRTIO VF devices .."

Are we realistically extending this beyond virtio-net?  Maybe all the
descriptions should be limited to what is actually supported as
proposed rather than aspirational goals.  Thanks,

Alex

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
