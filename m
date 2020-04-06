Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47719F967
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 17:57:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 921B088214;
	Mon,  6 Apr 2020 15:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRMI+lJ2C1Ov; Mon,  6 Apr 2020 15:57:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB4748821F;
	Mon,  6 Apr 2020 15:57:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4D68C0177;
	Mon,  6 Apr 2020 15:57:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40509C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3C10F881EC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJZ5BUO+WZlm
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:57:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5837E88214
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586188669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mYadafEf2dHzsAtvL1A3mRX9tgv7C1wkjybbY7fHUNg=;
 b=TZ0XCPxqEoN3gO6pm0KZABYBbTQ15LFkI8aGCtApnHrdeQxBQF2ZksUWwvsYvesBgNSa6s
 opgdT6xIrGvbSLajTPCcXu8hi4KPNK3zevfMlWYUjKt4gHrch1pRubQf+J4Ktj2WLwIZKd
 BalkfYBCh+eD+2dZe/T619NpcekFX88=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-Uk66T6-7Np2SYnxjKAZfsg-1; Mon, 06 Apr 2020 11:57:47 -0400
X-MC-Unique: Uk66T6-7Np2SYnxjKAZfsg-1
Received: by mail-wr1-f71.google.com with SMTP id t25so17566wrb.16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 08:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mYadafEf2dHzsAtvL1A3mRX9tgv7C1wkjybbY7fHUNg=;
 b=f6VwZ2fWVYFhN/LCo7oR6MB34CpVFTreYhxPgCmDOVcz4f7c9IOH8uUkAy24WRbF4f
 T96HsoVgXrw+mCL6aTQo2ov1JqlsSFCd4R2eObdwAPXZQNptVWBmpgvili+N9hrhJ6Zf
 mUtTPcNTaTAJt4lrlFHRdwoYaZ49bKalTvXiWHwS+XGFybtRhnb3PIgLGlXDTmyb+vqE
 GqLCZQwE4JcS/um5zbUEQHiJs1hIFH/AFfTzIFXWJXyPvZlNICa8wc/rgKjuoGFZ51jQ
 OG+u3pGIlBSe5v/QO+0J+Sf7alUGSC0vaXyGXLB6kKkkdB+5A+UsZpm2Hdlr8DLWqdNH
 9Zvw==
X-Gm-Message-State: AGi0PubGcrZ+w72nb7+WUgf7tJJtMm9NDXXOLvbIVv5vVJoyqvbqhmPH
 XdkJU+6yjNprPkKbTznptigsYk4UYDJ1Y67LDyoeRfrzfSDXr7TyGlAEM1Kx4tE7ezTTxaEVkHM
 0QtV+O4fiqU9++KkEg/lQTTq/jZHLJEC0d8c38UFIfw==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr8809749wrr.354.1586188666451; 
 Mon, 06 Apr 2020 08:57:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypJIgQGlWFOIgWSCeubvPOjYqpvDuQLV4/yUVkI1Zn2LL67ge2cp9C7u+SLHfxdIwD4AcPvUdA==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr8809739wrr.354.1586188666301; 
 Mon, 06 Apr 2020 08:57:46 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f3sm37676wmj.24.2020.04.06.08.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 08:57:45 -0700 (PDT)
Date: Mon, 6 Apr 2020 11:57:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] virtio: stop using legacy struct vring
Message-ID: <20200406115653-mutt-send-email-mst@kernel.org>
References: <20200406153245.127680-1-mst@redhat.com>
 <20200406153245.127680-2-mst@redhat.com>
 <20200406155602.GA160445@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20200406155602.GA160445@kroah.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Arnd Bergmann <arnd@arndb.de>, Vadim Pasternak <vadimp@mellanox.com>,
 linux-kernel@vger.kernel.org, Sudeep Dutt <sudeep.dutt@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Darren Hart <dvhart@infradead.org>,
 platform-driver-x86@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Andy Shevchenko <andy@infradead.org>
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

On Mon, Apr 06, 2020 at 05:56:02PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 06, 2020 at 11:35:23AM -0400, Michael S. Tsirkin wrote:
> > struct vring (in the uapi directory) and supporting APIs are kept
> > around to avoid breaking old userspace builds.
> > It's not actually part of the UAPI - it was kept in the UAPI
> > header by mistake, and using it in kernel isn't necessary
> > and prevents us from making changes safely.
> > In particular, the APIs actually assume the legacy layout.
> > 
> > Add struct vring_s (identical ATM) and supporting
> > legacy APIs and switch everyone to use that.
> 
> How are we going to know that "struct vring_s" is what we need/want to
> use?  What does "_s" mean?
> 
> "struct vring_kernel"?
> 
> naming is hard...
> 
> greg k-h

Hmm. I guess I can just add an ifdef so kernel doesn't see the UAPI
version anymore ...

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
