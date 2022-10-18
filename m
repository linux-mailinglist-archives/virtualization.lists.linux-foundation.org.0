Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA46026B3
	for <lists.virtualization@lfdr.de>; Tue, 18 Oct 2022 10:24:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58D5282512;
	Tue, 18 Oct 2022 08:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58D5282512
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PIfwth9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zhaUR9F3QD8; Tue, 18 Oct 2022 08:24:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2BE9782419;
	Tue, 18 Oct 2022 08:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BE9782419
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C5DFC007C;
	Tue, 18 Oct 2022 08:24:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E60EC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 08:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7245960FE4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 08:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7245960FE4
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PIfwth9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGdDcvHrIzGb
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 08:24:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F53E60FE2
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F53E60FE2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666081462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oFMZuNyyUulyOpQ7h1Jmv72tRHXWL0EEtBmV7WxlCJI=;
 b=PIfwth9E/8SWdFCWKNalSzfKxcdJ8SpnXzPED1aiPt/LBFVw0uU9p8jv4r7E6etbOcvWnh
 iuFLbWUo5FYxp6qZhYeODxXk1M1bk55FCB7X2daz+9yjhzozIbxVVyg57B/pux4636bZjh
 smDnXuXpp8MxvkMRIJSj2hKhIdbaYe8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-qr3RDuyHO6Kc4JzWRDgRxA-1; Tue, 18 Oct 2022 04:24:20 -0400
X-MC-Unique: qr3RDuyHO6Kc4JzWRDgRxA-1
Received: by mail-ej1-f69.google.com with SMTP id
 sd5-20020a1709076e0500b0078de7be1ee3so6050906ejc.23
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 01:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFMZuNyyUulyOpQ7h1Jmv72tRHXWL0EEtBmV7WxlCJI=;
 b=CZUz55lthgKQlY/rvZkev24EKljbyxKVDp3NkrIB/Rvss9vzHK7pmtEh5EST5GcqlP
 MsYtBIAyjSB1et3Vb5WTIK8AAeVxlXdGLibsRmfseWpCFabEGeR72HTztyUcK9Gek52x
 vUi9+aCAHjqAu41K8fU6qgVLnVk+wPY1JPAphwhI7zkAqhUFHd6C4W4W7JS7U8Ja4PLH
 b/9l7fDsooaRe6saEGIeuJZp/Ghm/0VlG2c4WoD3tekGOeX7YfrrSO7VUbTUoc0eLltq
 QPrMMka5jgYUXauratjwasfG26iwwL+5dleVuI0eau6SXzX53kYPXDyPNo3tnkYHjSxO
 zofA==
X-Gm-Message-State: ACrzQf3rLOSvMRRRL1WEXc3130yqLQbeOS9JLrZdlMTW00B+bTThJi6W
 VmeRabqRUuHwD53Me6O0hyXd4P8tFPPlsC7oQhn721N5/XUJDR4+5jZx9xl2Rf015PawLDMBtqk
 2OLHPBSkF26gnCBCQQLv3hIdGS9aM8D6rwtoOsPSo8A==
X-Received: by 2002:a05:6402:406:b0:458:a47:d14c with SMTP id
 q6-20020a056402040600b004580a47d14cmr1554579edv.41.1666081459652; 
 Tue, 18 Oct 2022 01:24:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4eixNuPIdyq9Q2wp3e9tnYgok8Rdr42uEMvWJRw8iB0+OQwkvT35iWACQ0uot95wNKkVOiPw==
X-Received: by 2002:a05:6402:406:b0:458:a47:d14c with SMTP id
 q6-20020a056402040600b004580a47d14cmr1554571edv.41.1666081459432; 
 Tue, 18 Oct 2022 01:24:19 -0700 (PDT)
Received: from redhat.com ([2.54.172.104]) by smtp.gmail.com with ESMTPSA id
 qw10-20020a170906fcaa00b0076f99055520sm7122901ejb.137.2022.10.18.01.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 01:24:18 -0700 (PDT)
Date: Tue, 18 Oct 2022 04:24:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
Subject: Re: [PATCH v3 0/4] vdpa: Add resume operation
Message-ID: <20221018042328-mutt-send-email-mst@kernel.org>
References: <cover.1666008238.git.sebastien.boeuf@intel.com>
 <20221018021506-mutt-send-email-mst@kernel.org>
 <137616129e0bfaba371b50786f3fd7d1fe0c95c9.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <137616129e0bfaba371b50786f3fd7d1fe0c95c9.camel@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "eperezma@redhat.com" <eperezma@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

On Tue, Oct 18, 2022 at 07:57:57AM +0000, Boeuf, Sebastien wrote:
> > Not on list:
> > 
> > $ b4 mbox cover.1666008238.git.sebastien.boeuf@intel.com
> > Looking up
> > https://lore.kernel.org/r/cover.1666008238.git.sebastien.boeuf%40intel.com
> > That message-id is not known.
> > $ 
> > 
> > 
> > dropped for now.
> 
> Oh I didn't realize the list wasn't receiving my patch series. What is
> the correct list? I was using virtualization@lists.linux-foundation.org
> which I found from the MAINTAINERS file.


I think that is a correct one. You can copy
lkml too. Neither one is getting your messages.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
