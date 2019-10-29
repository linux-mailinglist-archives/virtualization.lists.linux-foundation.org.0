Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 554EDE8CD5
	for <lists.virtualization@lfdr.de>; Tue, 29 Oct 2019 17:35:31 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 50DEED07;
	Tue, 29 Oct 2019 16:35:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B1D3CD07
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:35:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6D5808A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:35:22 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC6FE757CF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:35:21 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id b4so1390855wrn.8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 09:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FQnLYx2QWY4cuAKWiCGGUv4yf2h+qdP8BhSsdB+2sT0=;
	b=qiWMLgidVEJT1b8XdNEC84tPVQ3yzJfjBMQLhyPKhJoicIKS1JRTHH3T6az/I+eVDs
	7jQl2mwNqV9kjap/91JkfFdv+SqlkW0fgj9d0Ffr6/ECvVnOKIwfBEOzqG5J/oeyHzxU
	HghLNZwAfPhADnhIRDhQVYUYBv/vt98RbPqqE580lgztVPALIQBQxc56Np1N+OTL8x1K
	MoYaOqgBSimg7kaaZ3KW1ynOBMabT+Vw9GQPLwagbSZ1AY/dql1HWLy5Hmg1kF3VjXxo
	xZUso98Gs7e10+JLwKJt+nXJ0vsx1J95zQP6GNRli6tNhXMgEcbs4my8GSnzH7Gb3aeG
	3C0Q==
X-Gm-Message-State: APjAAAXCyrxKV/muDjKCpiLoYvlddIiTdxmBcb+lLgwB/ouZgaZsPvOd
	dlUC/wJD9Yn1wTP/OiCYxvR08P5t6aZrYS5GB93dZCUscfgMMI5ym2vj1a1BRgZzLT9IwPrxLKP
	jpFN/v/bdk9fWg8S3hZ2mTxwMmvirvPXnAwNRocs9aQ==
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr5321607wme.92.1572366920614; 
	Tue, 29 Oct 2019 09:35:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx29BHLiojOUxFUuXNicrwQ7MqELEUWM6W1qCELpsBAD/xgXR4ttLraQVt+y1hgrjzLl0jEJQ==
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr5321583wme.92.1572366920428; 
	Tue, 29 Oct 2019 09:35:20 -0700 (PDT)
Received: from steredhat (94.222.26.109.rev.sfr.net. [109.26.222.94])
	by smtp.gmail.com with ESMTPSA id
	r19sm18295914wrr.47.2019.10.29.09.35.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 09:35:19 -0700 (PDT)
Date: Tue, 29 Oct 2019 17:35:16 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Message-ID: <20191029163516.td6wk7lf5pmytwtk@steredhat>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-13-sgarzare@redhat.com>
	<20191027081752.GD4472@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191027081752.GD4472@stefanha-x1.localdomain>
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
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Sun, Oct 27, 2019 at 09:17:52AM +0100, Stefan Hajnoczi wrote:
> On Wed, Oct 23, 2019 at 11:55:52AM +0200, Stefano Garzarella wrote:
> > +static int __init vmci_transport_init(void)
> > +{
> > +	int features = VSOCK_TRANSPORT_F_DGRAM;
> 
> Where is this variable used?

It is introduced in the previous patch "vsock: add multi-transports support",
and it is used in the vsock_core_register(), but since now the
vmci_transport_init() registers the vmci_transport only with DGRAM
feature, I can remove this variable and I can use directly the
VSOCK_TRANSPORT_F_DGRAM.

I'll fix in the v3.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
