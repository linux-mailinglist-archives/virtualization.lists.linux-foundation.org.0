Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DB38510551E
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 16:14:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F2B986C69;
	Thu, 21 Nov 2019 15:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeerOu7sZ9Xz; Thu, 21 Nov 2019 15:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 268C286CB8;
	Thu, 21 Nov 2019 15:14:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F074DC18DA;
	Thu, 21 Nov 2019 15:14:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A118C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4076321511
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHQ6FqkaQVez
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:14:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id CAE4820437
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574349242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/ndUKKJCxI76HoRVTG7jNdszQTcPJXiUk69ASnD9hc=;
 b=BFZPun6Wui8mst5ik4v+igZbbNO52U03jnmSpDZ1ATsGYUxUJFr+Ti3ykcD52EkazKpp+B
 ko2SioijMq46xlosEU/tY9Nt7mHwLezU+K1xLd3BvLSJRmSAi5PvMABX2yMrB2PxStfrsf
 GYB6ESIY9PDnA2Y+Db56AsDis/pFM7w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-NT_T0PJ-PzS8NjuTc2BX3Q-1; Thu, 21 Nov 2019 10:13:59 -0500
Received: by mail-wm1-f72.google.com with SMTP id m68so1942448wme.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 07:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iHsCY/CMXwIcgnSHclUoHJ8eh4Q1rh48lgjW6W5ihDs=;
 b=rCaeLbzU2eR2deeTmc18uLYK4snLb4pCi+0D81j6o9cJ7Dh8ULZ4rJ+cnCfkgnbTnj
 xzPF07xTDhJJZlN77SkkRZoASFFSDfPWEWhcQNLIti8H7Nx7YTDzOwDiDSuRlFUUU/27
 JRKQ3uX4uR2AbWUPcfq5OI7WIV9OGq4yuBuW//ui1GOUGLmpa++kUbKjn5A3K+8HcuXt
 fIbLLkhoFzXdmvCVXPcxWzyxxsq1Ut29890BORz5sAudfwVq9nJVowHXjTUZwuJFfV7U
 7xMNuWw6fxLL07oMjmnU9S0XBQylm9VY0r8WOwwJeE85hInBWxbyY6sxF5C5tujDLgPZ
 WKfg==
X-Gm-Message-State: APjAAAXGsWdRcr9CFkRe4gtamKBO86Yg3nWSZHtwAyFq/7Mz+phhB2C0
 RwTu0tsB2T5hKiTLaf4y1a/up8Aub3TjpP0FVSWpdO56coReYaZYUbmuoxC3+MqxLfXdRxcqM1u
 lMzmClnK0urfoYNe6kTMKamMsbvZqsx9lWw6+oDmF8w==
X-Received: by 2002:adf:fd4a:: with SMTP id h10mr10771262wrs.90.1574349237926; 
 Thu, 21 Nov 2019 07:13:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwffrnaWrX2CTnz1mrGFjyWf4QxuPdCHsb+nu0fFKK6LVRRphnlRgzFqP4BBbEKQFy/2FMiLQ==
X-Received: by 2002:adf:fd4a:: with SMTP id h10mr10771237wrs.90.1574349237686; 
 Thu, 21 Nov 2019 07:13:57 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id z7sm1978953wma.46.2019.11.21.07.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 07:13:57 -0800 (PST)
Date: Thu, 21 Nov 2019 16:13:55 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 0/6] vsock: add local transport support
Message-ID: <20191121151355.grgfbte6xniqe6xo@steredhat>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <MWHPR05MB3376B8241546664BBCA6FC37DA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR05MB3376B8241546664BBCA6FC37DA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
X-MC-Unique: NT_T0PJ-PzS8NjuTc2BX3Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

On Thu, Nov 21, 2019 at 02:45:32PM +0000, Jorgen Hansen wrote:
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > Sent: Tuesday, November 19, 2019 12:01 PM
> > This series introduces a new transport (vsock_loopback) to handle
> > local communication.
> > This could be useful to test vsock core itself and to allow developers
> > to test their applications without launching a VM.
> > 
> > Before this series, vmci and virtio transports allowed this behavior,
> > but only in the guest.
> > We are moving the loopback handling in a new transport, because it
> > might be useful to provide this feature also in the host or when
> > no H2G/G2H transports (hyperv, virtio, vmci) are loaded.
> > 
> > The user can use the loopback with the new VMADDR_CID_LOCAL (that
> > replaces VMADDR_CID_RESERVED) in any condition.
> > Otherwise, if the G2H transport is loaded, it can also use the guest
> > local CID as previously supported by vmci and virtio transports.
> > If G2H transport is not loaded, the user can also use VMADDR_CID_HOST
> > for local communication.
> > 
> > Patch 1 is a cleanup to build virtio_transport_common without virtio
> > Patch 2 adds the new VMADDR_CID_LOCAL, replacing
> > VMADDR_CID_RESERVED
> > Patch 3 adds a new feature flag to register a loopback transport
> > Patch 4 adds the new vsock_loopback transport based on the loopback
> >         implementation of virtio_transport
> > Patch 5 implements the logic to use the local transport for loopback
> >         communication
> > Patch 6 removes the loopback from virtio_transport
> > 
> > @Jorgen: Do you think it might be a problem to replace
> > VMADDR_CID_RESERVED with VMADDR_CID_LOCAL?
> 
> No, that should be fine. It has never allowed for use with stream sockets in
> AF_VSOCK. The only potential use would be for datagram sockets, but that
> side appears to be unaffected by your changes, since loopback is only
> introduced for SOCK_STREAM.
> 

Yes, datagram sockets are not affected.

Thanks for the clarification,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
