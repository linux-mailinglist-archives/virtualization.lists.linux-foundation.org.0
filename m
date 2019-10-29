Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAD3E8CA7
	for <lists.virtualization@lfdr.de>; Tue, 29 Oct 2019 17:27:33 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1E3B4D12;
	Tue, 29 Oct 2019 16:27:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A58D4CC2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:27:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8FD7B8A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:27:24 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E44B81F07
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:27:23 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id p6so1622896wrs.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 09:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=C6bDuPajdG9JVS65/nNfvWestag5Xwy94+uZABzDGas=;
	b=mpPUxXjt57r8KkbkrsHp8o8H/VjnkoVTzVTaq+NEavro+7N7S6ZkYNoftH0rDoLotV
	gltnBByBQm+KOT89Cr+jgSB/9YYQNyYpc23cYoHZOQqHKWaxHO4XWokGGvg3OgY3gyv3
	ybRc+fzy5B4afvY51qJaXiuhT1iHU8fGyfCdtomGXtw4wywylZh4Lc5fLF1N3YSRzzb8
	2X6bvsdcI6nd4w9u3w4RjAKjG+ovoBgyKuVgMqUUse7hLMIhvRdhC75U8GK1A+k7MXoQ
	Ra5E+MhV0KWgQj6QsQte7ea8mm9Q0XGzLRIOTzo/Y5hlRp+YHLcu6mRSRkUJNHnfz8/t
	CEBw==
X-Gm-Message-State: APjAAAXPYZHucbOml1TZyE6wDOD7Gz+dTTvV2JqXtWhh8k2axLWBjH95
	ZyfAtn+DZoKqgzmATWXreNqQfCl6hKCOLPiV7nO2subLhr4ukZZcUGb1FPR/r6Y+duBqQ+8NY40
	RKCXO0MaerUScUGoeXahlCRPMNxcwgIqBMdkX5xlW0g==
X-Received: by 2002:a7b:c924:: with SMTP id h4mr5203719wml.143.1572366442237; 
	Tue, 29 Oct 2019 09:27:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqcoHXB/eGlbAvP8/zQv1DhxCc9oHsJCpQ0Me1i12d1jrxIWteVIy4TZqjG4WQmNpAjkkq4g==
X-Received: by 2002:a7b:c924:: with SMTP id h4mr5203696wml.143.1572366441980; 
	Tue, 29 Oct 2019 09:27:21 -0700 (PDT)
Received: from steredhat (94.222.26.109.rev.sfr.net. [109.26.222.94])
	by smtp.gmail.com with ESMTPSA id
	v10sm4015055wmg.48.2019.10.29.09.27.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 09:27:21 -0700 (PDT)
Date: Tue, 29 Oct 2019 17:27:12 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, Adit Ranadive <aditr@vmware.com>,
	Vishnu Dasa <vdasa@vmware.com>, Andy king <acking@vmware.com>,
	Aditya Sarwade <asarwade@vmware.com>,
	George Zhang <georgezhang@vmware.com>, Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 00/14] vsock: add multi-transports support
Message-ID: <20191029162712.fn5rgxrwdrbxuehw@steredhat>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191027080146.GA4472@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191027080146.GA4472@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>
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

On Sun, Oct 27, 2019 at 09:01:46AM +0100, Stefan Hajnoczi wrote:
> On Wed, Oct 23, 2019 at 11:55:40AM +0200, Stefano Garzarella wrote:
> > This series adds the multi-transports support to vsock, following
> > this proposal: https://www.spinics.net/lists/netdev/msg575792.html
> > 
> > With the multi-transports support, we can use VSOCK with nested VMs
> > (using also different hypervisors) loading both guest->host and
> > host->guest transports at the same time.
> > Before this series, vmci-transport supported this behavior but only
> > using VMware hypervisor on L0, L1, etc.
> > 
> > RFC: https://patchwork.ozlabs.org/cover/1168442/
> > RFC -> v1:
> > - Added R-b/A-b from Dexuan and Stefan
> > - Fixed comments and typos in several patches (Stefan)
> > - Patch 7: changed .notify_buffer_size return to void (Stefan)
> > - Added patch 8 to simplify the API exposed to the transports (Stefan)
> > - Patch 11:
> >   + documented VSOCK_TRANSPORT_F_* flags (Stefan)
> >   + fixed vsock_assign_transport() when the socket is already assigned
> >   + moved features outside of struct vsock_transport, and used as
> >     parameter of vsock_core_register() as a preparation of Patch 12
> > - Removed "vsock: add 'transport_hg' to handle g2h\h2g transports" patch
> > - Added patch 12 to register vmci_transport only when VMCI guest/host
> >   are active
> 
> Has there been feedback from Jorgen or someone else from VMware?  A
> Reviewed-by or Acked-by would be nice since this patch series affects
> VMCI AF_VSOCK.
> 

Unfortunately not for now, I'm adding to this thread some VMware guys that
reviewed latest vmci patches.

Would be nice to have your feedback for these changes.

Thanks in advance,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
