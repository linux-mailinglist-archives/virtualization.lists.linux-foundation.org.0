Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB6B141D35
	for <lists.virtualization@lfdr.de>; Sun, 19 Jan 2020 10:59:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 84AB420356;
	Sun, 19 Jan 2020 09:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rc5dlbEyG6tz; Sun, 19 Jan 2020 09:59:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 86445203DA;
	Sun, 19 Jan 2020 09:59:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53242C0881;
	Sun, 19 Jan 2020 09:59:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FF09C0174
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 09:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 58DA284F4C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 09:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bJoviHOBB+X
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 09:59:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EC06084F27
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579427974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RBsez8nF60syx6uO6vVLgbM1Sl7Se03CnUJjUyZLN0=;
 b=hCcZzNUemcCpsLumd8XwYIWOk1tLAUUFlRpe+Sze+SBXFYh/etBo3j8VtCfkoIkz79BU6M
 l5lCNi4Lkp143g/yxUkPFgIsUdMUz8/YgwkRPcSLLu0LCmo+jsYajxXXkGEVmFxCUU2dal
 XYW42ZzvgjOMB9X+//XAH2aNHKOsosE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-Bnb0UhCANT6sl8w_-TSqiw-1; Sun, 19 Jan 2020 04:59:30 -0500
Received: by mail-qk1-f197.google.com with SMTP id g28so18468848qkl.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 01:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9RBsez8nF60syx6uO6vVLgbM1Sl7Se03CnUJjUyZLN0=;
 b=QgsOsl8Q0p0jqXNDcAgHWb6omxU00vyE10o/O3gMEhnCXOg+xyKqa/22UFnw1rbsFp
 p71wl03L00N7F6YQgin8gyTdBLoYI0RpozHShYG+GVYGJJcgBwkHjzUWcnanV+cDK0mW
 wo5i0/frdCcgNVuOvCH9KE0467GVlIwZz9VEamjQHi4AXvFEl4ZSI4vYkXJmiHV6CJr4
 iTqw0ogaugak/rLiIcUo2JD2NuHSCwuq91Eq+aQuM/5BVpjr5g3JRlCtm4oTjWLspl7/
 PddW0MPbNcsM6fad+TDAg3pUOvKkNdlChrYoB/bTpLc7JdUoZYIRsrWEPlOwJG2LuLPi
 huOw==
X-Gm-Message-State: APjAAAVazTLjVgP7/1RLgnVXi3471cZObsHyTqUEXn3pWkZ1fJNnTZuF
 KOU4hs3++dM8Sf8jnL3zCbjfAF9poONDPDy9dxaLfcu2SSycOvURFw8VOqb5JvbB3crth5AcGx/
 Oxuy0UFPwbAKkvSeSyX311MA7ecwB47XqIW4971sP/w==
X-Received: by 2002:a05:620a:166a:: with SMTP id
 d10mr45426264qko.37.1579427970353; 
 Sun, 19 Jan 2020 01:59:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQHb/giklfzhDUxPQigzeGmKW4ihwH4cIVdw4qNSRvx+9dDqW3AslJF469jKiTK5R9qVYMmg==
X-Received: by 2002:a05:620a:166a:: with SMTP id
 d10mr45426237qko.37.1579427970157; 
 Sun, 19 Jan 2020 01:59:30 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id h1sm16162903qte.42.2020.01.19.01.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 01:59:28 -0800 (PST)
Date: Sun, 19 Jan 2020 04:59:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shahaf Shuler <shahafs@mellanox.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200119045849-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
X-MC-Unique: Bnb0UhCANT6sl8w_-TSqiw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "Wang, Zhihong" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Netdev <netdev@vger.kernel.org>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

On Sun, Jan 19, 2020 at 09:07:09AM +0000, Shahaf Shuler wrote:
> >Technically, we can keep the incremental API 
> >here and let the vendor vDPA drivers to record the full mapping 
> >internally which may slightly increase the complexity of vendor driver. 
> 
> What will be the trigger for the driver to know it received the last mapping on this series and it can now push it to the on-chip IOMMU?

Some kind of invalidate API?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
