Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9240F104FE3
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 11:02:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3846021517;
	Thu, 21 Nov 2019 10:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8f5b-2DNxDPE; Thu, 21 Nov 2019 10:02:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 28ADA2152C;
	Thu, 21 Nov 2019 10:02:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5E96C18DA;
	Thu, 21 Nov 2019 10:02:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36F8BC18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 10:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2B52487EAE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 10:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKwFbMs5qELh
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 10:02:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 40ADD87E93
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 10:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574330522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEzzNkobngto7A7JkTiA2JRstWm/Qwf1aRo6Iv3/3m8=;
 b=fZII8SnesxP12BAZD1i2J1v+YX9UnFPg5MbaGwoWuYzcQGymkKzfdd5WrNz8fFAohy7kO6
 QnrdVbiYMnLkWScM5Sv5FcYrD9FmcdjUgPrSw9gahCDj+5fhwhSXvJvo6eQRQKGyoMFioo
 mNTJ+NQU/T29IRuo71j2cR+kr45Ah5k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-ypQeMA6xMeG2feGO45sKGA-1; Thu, 21 Nov 2019 05:02:00 -0500
Received: by mail-wm1-f70.google.com with SMTP id y14so1554972wmi.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 02:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tFqAKgUAsSLJXhwvvIOsI4T22gRsWSmbmVmEZ/F0Ht4=;
 b=uFrry33FbRJs5H0BzL5A+BiLYFosj+SEO1tXJo2I+I3pHOpTQtVp0g1aXHslCq9roW
 9tS5jELGG+iCfykRdEa8W3+nUSt26+MyG9PC1whVsZ9QNSYKyBfxseOGNHj9vOKSvgb4
 IgYRBxhJb7BDjDYtLSuGX9SwM5fGDIg+Cq8NMfMdK8s7E9Rgu9OaLOZYB3z1Xr/NGJ6l
 7ZFJzewk9HAJ4yUj0T10Kc1bXgHuEnK/mHkbbLHvWgzStphYoRFFJBmTXKIYUcFoRHWd
 bs4sLFAna2zDVIiOeBAa1QnCw52jasvmXe7KhaErFhAETCFdWa8GhaVt9SpClsKYcwCu
 yFww==
X-Gm-Message-State: APjAAAXCSx1C4hBZ7H/3VJDGuUDbrwAe9/YArcR6PBYimO4S6Y1EnBu9
 u6qf4JTeUwLpZ1TQfLYNmjDgSSZ757xVT7L/qpq1NDQZL6yHaTA5ovq/U84WTG2rpzu7ygJIhyf
 fCmpapQbCjyqfbjvAV2bjlMuxjPIg2cscGH3wOdeRJg==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr274457wri.274.1574330519204; 
 Thu, 21 Nov 2019 02:01:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxy6brRF1ev/m1DKBfFjA6HTGnTBIhroRW1ilhIuPxww1/cdIQc+e2rt6PwX9NqSCpO1cJSPg==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr274435wri.274.1574330519006; 
 Thu, 21 Nov 2019 02:01:59 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id f188sm2272358wmf.3.2019.11.21.02.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 02:01:58 -0800 (PST)
Date: Thu, 21 Nov 2019 11:01:56 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH net-next 5/6] vsock: use local transport when it is loaded
Message-ID: <20191121100156.v4ehwmstlhujrviv@steredhat>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-6-sgarzare@redhat.com>
 <20191121094614.GC439743@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191121094614.GC439743@stefanha-x1.localdomain>
X-MC-Unique: ypQeMA6xMeG2feGO45sKGA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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

On Thu, Nov 21, 2019 at 09:46:14AM +0000, Stefan Hajnoczi wrote:
> On Tue, Nov 19, 2019 at 12:01:20PM +0100, Stefano Garzarella wrote:
> > @@ -420,9 +436,10 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> >  		new_transport = transport_dgram;
> >  		break;
> >  	case SOCK_STREAM:
> > -		if (remote_cid <= VMADDR_CID_HOST ||
> > -		    (transport_g2h &&
> > -		     remote_cid == transport_g2h->get_local_cid()))
> > +		if (vsock_use_local_transport(remote_cid))
> > +			new_transport = transport_local;
> > +		else if (remote_cid == VMADDR_CID_HOST ||
> > +			 remote_cid == VMADDR_CID_HYPERVISOR)
> >  			new_transport = transport_g2h;
> >  		else
> >  			new_transport = transport_h2g;
> 
> We used to send VMADDR_CID_RESERVED to the host.  Now we send
> VMADDR_CID_RESERVED (LOCAL) to the guest when there is no
> transport_local loaded?
> 
> If this is correct, is there a justification for this change?  It seems
> safest to retain existing behavior.

You're right, I'll revert this change in v2.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
