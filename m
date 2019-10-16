Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F11D85B8
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 04:06:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 03FB3C83;
	Wed, 16 Oct 2019 02:06:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D638B89B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 02:06:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 76BC614D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 02:06:52 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y72so13644206pfb.12
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 19:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UUyOL2RIItCROatK1a3xuyc4JsvfPMONoizipcHDbl0=;
	b=SeWXto8TKxbAR5Gk7e3/sNJ93alMjzCClvODSG30bXgpV//NkHjE/CrxFes/2PuIrm
	1ZaQoszX9l1cAIP0YZMAAg5IL5/aO/IYZYBwvSGvB8Ed7iN6v4mpuy8jvNosThAVKik3
	xrlKdq3W/y91a7mk7btm2RdUK9Kj2pweOZnt0KNfktRKvuLLPpuoffdYEqWQeTXFeM9H
	XRe11OkLfpHKgnnaJeIiX4MRA3hTvwECaamHV2EBqsDpjsDtYmdpTaf/mgzaAwlX8mhV
	GDnn7eaZ8tFe2FaLPpRBUYzBxEiSvp7VWuxu1IsKoiM5LJUYQLwaUNzAhg14u1/Uutok
	niFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UUyOL2RIItCROatK1a3xuyc4JsvfPMONoizipcHDbl0=;
	b=AyuN/EmU37Q/JZJWA1/g4JbRHhvGge8Wqpy/5vJWMNcZPS5PQ7UyEUb+L598JLMQlU
	BYCnabF/MJFuPTPtJ8FFikm+y21Id76AAYoJMKzKRfuPwMdiMg61yn3rUB13GFAZnwEv
	/1QtV/BvS6jRn5qaqJR3McFUwRUUyuEYe/DGtAaeuiDbI/OCqUi9WuysGRXGJXFJfRVW
	TfHWPLLQqN9xQXO1ijKjYz+4gR9ABrz1By6N5eMFZwCs28XaVo+1q5NuYfrhMv2f+9ja
	25o4Oap1AptQ1HrZXoXUUbBkZqZI/f5jjyLMoCy22mSdEnen1//SyG2CpfP/FFs58Fof
	4mIQ==
X-Gm-Message-State: APjAAAX3rMRvoSk+8HftN6KT4u8KGvPoq7z4su2wW7xL2AYFe9//jQ80
	7/rFOmHPTJMxt2hlvS5CQ9heug==
X-Google-Smtp-Source: APXvYqwkwJFDGyB+giPsa2PBmCrDHadkgO1bXhA+XZVLm8X0qvRt1WvbEfJ3lNRuqHDVSPo85pGEQg==
X-Received: by 2002:a17:90a:ff0f:: with SMTP id
	ce15mr1971060pjb.14.1571191611965; 
	Tue, 15 Oct 2019 19:06:51 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
	by smtp.gmail.com with ESMTPSA id
	e16sm11583122pgt.68.2019.10.15.19.06.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Oct 2019 19:06:51 -0700 (PDT)
Date: Tue, 15 Oct 2019 19:06:49 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [RFC 1/2] vhost: IFC VF hardware operation layer
Message-ID: <20191015190649.54ddc91c@hermes.lan>
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

> +	IFC_INFO(&dev->dev, "PCI capability mapping:\n"
> +				"common cfg: %p\n"
> +				"notify base: %p\n"
> +				"isr cfg: %p\n"
> +				"device cfg: %p\n"
> +				"multiplier: %u\n",
> +				hw->common_cfg,
> +				hw->notify_base,
> +				hw->isr,
> +				hw->dev_cfg,
> +				hw->notify_off_multiplier);

Since kernel messages go to syslog, syslog does not handle multi-line
messages very well. This should be a single line.

Also, this is the kind of message that should be at the debug
level; something that is useful to the driver developers
but not something that needs to be filling up every end users log.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
