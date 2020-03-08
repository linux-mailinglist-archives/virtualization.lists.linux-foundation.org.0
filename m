Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BD32117D62E
	for <lists.virtualization@lfdr.de>; Sun,  8 Mar 2020 21:59:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 55D7387FDD;
	Sun,  8 Mar 2020 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ENStUuisepA; Sun,  8 Mar 2020 20:59:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D54087F19;
	Sun,  8 Mar 2020 20:59:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60357C0177;
	Sun,  8 Mar 2020 20:59:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C992EC0177
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 20:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B34D686CAE
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 20:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-D5XRiHaGD8
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 20:59:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CE38286B2C
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 20:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583701167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTdko1X8oY35o5Ajs4E1sA7nR54LL7YHW9Y7Gtl0cVM=;
 b=jAmpiEcItMZGfxBCUqrleE9qeQ9hXbygxlUHXasT0YIr4qFsXUgikYQGghXE/8MuIZBcf9
 uQQT4JCTvMNBMA+nc1qjz7Vh6bWIKRi2kC2whQQ5K0VqnwAKAfEVcwgbWvjQdab1nVVWQj
 36y+cKxrFwPKzAsmc5uPDJplTbHJyQ0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-WdLZ2IL2NTCRQaq_5GWvTQ-1; Sun, 08 Mar 2020 16:59:26 -0400
X-MC-Unique: WdLZ2IL2NTCRQaq_5GWvTQ-1
Received: by mail-qt1-f197.google.com with SMTP id o10so5459162qtk.22
 for <virtualization@lists.linux-foundation.org>;
 Sun, 08 Mar 2020 13:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jTdko1X8oY35o5Ajs4E1sA7nR54LL7YHW9Y7Gtl0cVM=;
 b=hKq4GQMnD8E4XYS7ZzDMQO3D12ZI8xI6JwAyjHSir1hJXx71JIZFycf0JSMN0CXHKH
 HLTAiCkeaOuwjFmq+ICQFxgDL/6ZntPICOLOyri6ocQFHhJP7wEJjn4RhnA0MmTxUZoP
 Mmwt0jGwy+IcCC5ivlQwCtpGvQ/+Vd7RMdvQD5LYovmeq9mRWcSIShATae/EzEH4Y2I/
 4aogtHhojjbC9eTIn3sPF+VADJFJYUjlJDNmi7mO93OwR70tti2hfZlOwZXXmHt7pvKp
 wkcXWfZv00x5ZRCbKx6PxddC2vHfP0/2/E+lpFvNzOzL7A0YVLQaVoYlIkDY6A4C7RV+
 Jm5w==
X-Gm-Message-State: ANhLgQ35kIK0XXV8LYv4+I5doPhCZ8CQUpjDa/uZisGSRWY9ivIa3x9u
 fsbdPhOgrevCYFjrXN2WUFnmasUwSUxzfpCO5bwl4Y8DcdzvstPsFaQNUdO3875K0YA2mOAchwI
 C5sz3xfNRgdWUVA9PJiWuTOuvOyE1U4IAdV2KzGduWQ==
X-Received: by 2002:ac8:5211:: with SMTP id r17mr6843909qtn.80.1583701165578; 
 Sun, 08 Mar 2020 13:59:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtshCJ03ihAj9AEZY+0Ib3id5JHDk+AC7jJYbpyXLcitB4H29vo4/Fuk9DwMmzBe6qIYBGRDQ==
X-Received: by 2002:ac8:5211:: with SMTP id r17mr6843898qtn.80.1583701165360; 
 Sun, 08 Mar 2020 13:59:25 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id w8sm2442025qkj.8.2020.03.08.13.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 13:59:24 -0700 (PDT)
Date: Sun, 8 Mar 2020 16:59:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] drivers: virtio: Make out_del_vqs dependent on
 BALLOON_COMPACTION
Message-ID: <20200308165831-mutt-send-email-mst@kernel.org>
References: <20200306105528.5272-1-vincenzo.frascino@arm.com>
 <4AB99BBC-0EC7-40F0-96ED-04796A73CBA2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4AB99BBC-0EC7-40F0-96ED-04796A73CBA2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gU3VuLCBNYXIgMDgsIDIwMjAgYXQgMDg6Mzg6MTlQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gCj4gCj4gPiBBbSAwNi4wMy4yMDIwIHVtIDExOjU2IHNjaHJpZWIgVmluY2Vu
em8gRnJhc2Npbm8gPHZpbmNlbnpvLmZyYXNjaW5vQGFybS5jb20+Ogo+ID4gCj4gPiDvu79vdXRf
ZGVsX3ZxcyBsYWJlbCBpcyBjdXJyZW50bHkgdXNlZCBvbmx5IHdoZW4gQkFMTE9PTl9DT01QQUNU
SU9OCj4gPiBjb25maWd1cmF0aW9uIG9wdGlvbiBpcyBlbmFibGVkLiBIYXZpbmcgaXQgZGlzYWJs
ZWQgdHJpZ2dlcnMgdGhlCj4gPiBmb2xsb3dpbmcgd2FybmluZyBhdCBjb21waWxlIHRpbWU6Cj4g
PiAKPiA+IGRyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmM6IEluIGZ1bmN0aW9uIOKAmHZp
cnRiYWxsb29uX3Byb2Jl4oCZOgo+ID4gZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYzo5
NjM6MTogd2FybmluZzogbGFiZWwg4oCYb3V0X2RlbF92cXPigJkKPiA+IGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1sYWJlbF0KPiA+ICA5NjMgfCBvdXRfZGVsX3ZxczoKPiA+ICAgICAg
fCBefn5+fn5+fn5+fgo+ID4gCj4gPiBNYWtlIG91dF9kZWxfdnFzIGRlcGVuZGVudCBvbiBCQUxM
T09OX0NPTVBBQ1RJT04gdG8gYWRkcmVzcyB0aGUKPiA+IGlzc3VlLgo+ID4gCj4gPiBDYzogIk1p
Y2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+ID4gQ2M6IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8
dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KPiAKPiBJIHRoaW5rIHRoaXMgaXMgbm93IHRoZSB0
aGlyZCBwYXRjaCBvbiB0aGUgbGlzdCB0aGF0IHRyaWVzIHRvIGZpeCB0aGlzIHdhcm5pbmcuCj4g
Cj4gTWljaGFlbCwgY2FuIHdlIGZpbmFsbHkgcXVldWUgb25lIG9mIHRoZXNlIChvciBpcyB0aGVy
ZSBvbmUgaW4gLW5leHQgYWxyZWFkeSAtIGRpZCBub3QgY2hlY2spPwo+IAo+IFRoYW5rcwoKSXQn
cyBxdWV1ZWQgaW4gbXkgdHJlZSAoYW5kIHdpbGwgYmUgaW4gbmV4dCBldmVudHVhbGx5KSwgSSBq
dXN0IGRpZG4ndApzZW5kIGl0IHRvIExpbnVzIHlldC4KU29ycnkgYWJvdXQgdGhlIGRlbGF5LgoK
LS0gCk1TVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
