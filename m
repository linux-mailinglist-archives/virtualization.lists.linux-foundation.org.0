Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170F15C311
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 16:41:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0338886E2A;
	Thu, 13 Feb 2020 15:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTt9hVo88fz5; Thu, 13 Feb 2020 15:41:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5DA6186E00;
	Thu, 13 Feb 2020 15:41:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CD91C08A4;
	Thu, 13 Feb 2020 15:41:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89368C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 80E6A86E15
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMt235dnSeUq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:41:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B7BF186E00
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581608477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ek7ovueQ1Zw26uD1wE6yB4d2TtRDHlkQXfHHqxBETA=;
 b=Rd0bRQzgtTD8VbCV8w1t0GbfoiWld97aFLDMhKiqBNuZH5Av6LrtyaS3xQs+MdnY4fv8YL
 GHuzwVy8cb0n6sQxmyszwXGrmz1c+s7PIuv/y3tcQZ4ZxIuhSBDJu3y1o4qmkxLxgl6Mcz
 /slilF5++Pawhj+uj67YWWBHHnYe7FM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-0UEPcr8hOGeL_0U_OB_e7Q-1; Thu, 13 Feb 2020 10:41:15 -0500
Received: by mail-qt1-f200.google.com with SMTP id p12so3886315qtu.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 07:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+ek7ovueQ1Zw26uD1wE6yB4d2TtRDHlkQXfHHqxBETA=;
 b=M++bdaJiFMGmXUFPad1QfdP4qXTyymAx4gTn8Z1cK14Q/pWLxYLZ/Acp38PqU273y9
 6sV08zm50dEtKJCuqAOhHn7aa5tmflN+vSrx6F5CvknnyWqjE2s3WXT6A98Q3jtj6BWU
 80IPaXqedI7ucM3WhlvFlpuX/42W0qwMZ9jAx2fB7VKpT77J4HjE2uFEU2r/WvpSDE1v
 2VoXGUueGnpiyD8ktFpEoJenck+l2c/f9Jsjo8S1jJNQCHF/P6IR4sUnQYIM5it3ls6K
 O0Bypka9AaV78FtwE7VkR/Rm9WU3Cu1uju2xWZ1yhPF0tvf5+0lckByOaBS7LZcUqOfS
 KdLQ==
X-Gm-Message-State: APjAAAXyN6f1PsPTvEM4dX+KDl2aqaK9Rk55sTTkxQ6stHfe4h2IQCd0
 4CGy2d3jVmAhN/lLW2GiANy7JpgDoY+8joviKzvUP4QcnZBQn0Kf8Qm7pJSONwLC+1PL0LU4lz4
 VMt9yOkUpzHhJNVz5ty6+iOH1+cewzVcV57HWCQdmMg==
X-Received: by 2002:ac8:73c7:: with SMTP id v7mr12288254qtp.269.1581608474719; 
 Thu, 13 Feb 2020 07:41:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxuqtb2eDuJSUZlrEktyKz5ywe6U44aZfk5M0ldus3W3zRLJxwzeEMRVv8ZApy9boqdJBD+1Q==
X-Received: by 2002:ac8:73c7:: with SMTP id v7mr12288206qtp.269.1581608474439; 
 Thu, 13 Feb 2020 07:41:14 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 x41sm1711309qtj.52.2020.02.13.07.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:41:13 -0800 (PST)
Date: Thu, 13 Feb 2020 10:41:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
Message-ID: <20200213103714-mutt-send-email-mst@kernel.org>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200213150542.GW4271@mellanox.com>
X-MC-Unique: 0UEPcr8hOGeL_0U_OB_e7Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, mhabets@solarflare.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTE6MDU6NDJBTSAtMDQwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgRmViIDEzLCAyMDIwIGF0IDEwOjU4OjQ0UE0gKzA4MDAsIEphc29u
IFdhbmcgd3JvdGU6Cj4gPiAKPiA+IE9uIDIwMjAvMi8xMyDkuIvljYg5OjQxLCBKYXNvbiBHdW50
aG9ycGUgd3JvdGU6Cj4gPiA+IE9uIFRodSwgRmViIDEzLCAyMDIwIGF0IDExOjM0OjEwQU0gKzA4
MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+IAo+ID4gPiA+ID4gICAgWW91IGhhdmUgZGV2LCB0
eXBlIG9yCj4gPiA+ID4gPiBjbGFzcyB0byBjaG9vc2UgZnJvbS4gVHlwZSBpcyByYXJlbHkgdXNl
ZCBhbmQgZG9lc24ndCBzZWVtIHRvIGJlIHVzZWQKPiA+ID4gPiA+IGJ5IHZkcGEsIHNvIGNsYXNz
IHNlZW1zIHRoZSByaWdodCBjaG9pY2UKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSmFzb24KPiA+ID4g
PiBZZXMsIGJ1dCBteSB1bmRlcnN0YW5kaW5nIGlzIGNsYXNzIGFuZCBidXMgYXJlIG11dHVhbGx5
IGV4Y2x1c2l2ZS4gU28gd2UKPiA+ID4gPiBjYW4ndCBhZGQgYSBjbGFzcyB0byBhIGRldmljZSB3
aGljaCBpcyBhbHJlYWR5IGF0dGFjaGVkIG9uIGEgYnVzLgo+ID4gPiBXaGlsZSBJIHN1cHBvc2Ug
dGhlcmUgYXJlIHZhcmlhdGlvbnMsIHR5cGljYWxseSAnY2xhc3MnIGRldmljZXMgYXJlCj4gPiA+
IHVzZXIgZmFjaW5nIHRoaW5ncyBhbmQgJ2J1cycgZGV2aWNlcyBhcmUgaW50ZXJuYWwgZmFjaW5n
IChpZSBsaWtlIGEKPiA+ID4gUENJIGRldmljZSkKPiA+IAo+ID4gCj4gPiBUaG91Z2ggYWxsIHZE
UEEgZGV2aWNlcyBoYXZlIHRoZSBzYW1lIHByb2dyYW1taW5nIGludGVyZmFjZSwgYnV0IHRoZQo+
ID4gc2VtYW50aWMgaXMgZGlmZmVyZW50LiBTbyBpdCBsb29rcyB0byBtZSB0aGF0IHVzZSBidXMg
Y29tcGxpZXMgd2hhdAo+ID4gY2xhc3MucnN0IHNhaWQ6Cj4gPiAKPiA+ICIKPiA+IAo+ID4gRWFj
aCBkZXZpY2UgY2xhc3MgZGVmaW5lcyBhIHNldCBvZiBzZW1hbnRpY3MgYW5kIGEgcHJvZ3JhbW1p
bmcgaW50ZXJmYWNlCj4gPiB0aGF0IGRldmljZXMgb2YgdGhhdCBjbGFzcyBhZGhlcmUgdG8uIERl
dmljZSBkcml2ZXJzIGFyZSB0aGUKPiA+IGltcGxlbWVudGF0aW9uIG9mIHRoYXQgcHJvZ3JhbW1p
bmcgaW50ZXJmYWNlIGZvciBhIHBhcnRpY3VsYXIgZGV2aWNlIG9uCj4gPiBhIHBhcnRpY3VsYXIg
YnVzLgo+ID4gCj4gPiAiCj4gCj4gSGVyZSB3ZSBhcmUgdGFsa2luZyBhYm91dCB0aGUgL2Rldi9Y
WCBub2RlIHRoYXQgcHJvdmlkZXMgdGhlCj4gcHJvZ3JhbW1pbmcgaW50ZXJmYWNlLiBBbGwgdGhl
IHZkcGEgZGV2aWNlcyBoYXZlIHRoZSBzYW1lIGJhc2ljCj4gY2hhcmRldiBpbnRlcmZhY2UgYW5k
IGRpc2NvdmVyIGFueSBzZW1hbnRpYyB2YXJpYXRpb25zICdpbiBiYW5kJwo+IAo+ID4gPiBTbyB3
aHkgaXMgdGhpcyB1c2luZyBhIGJ1cz8gVkRQQSBpcyBhIHVzZXIgZmFjaW5nIG9iamVjdCwgc28g
dGhlCj4gPiA+IGRyaXZlciBzaG91bGQgY3JlYXRlIGEgY2xhc3Mgdmhvc3RfdmRwYSBkZXZpY2Ug
ZGlyZWN0bHksIGFuZCB0aGF0Cj4gPiA+IGRyaXZlciBzaG91bGQgbGl2ZSBpbiB0aGUgZHJpdmVy
cy92aG9zdC8gZGlyZWN0b3J5Lgo+ID4gIAo+ID4gVGhpcyBpcyBiZWNhdXNlIHdlIHdhbnQgdkRQ
QSB0byBiZSBnZW5lcmljIGZvciBiZWluZyB1c2VkIGJ5IGRpZmZlcmVudAo+ID4gZHJpdmVycyB3
aGljaCBpcyBub3QgbGltaXRlZCB0byB2aG9zdC12ZHBhLiBFLmcgaW4gdGhpcyBzZXJpZXMsIGl0
IGFsbG93cwo+ID4gdkRQQSB0byBiZSB1c2VkIGJ5IGtlcm5lbCB2aXJ0aW8gZHJpdmVycy4gQW5k
IGluIHRoZSBmdXR1cmUsIHdlIHdpbGwKPiA+IHByb2JhYmx5IGludHJvZHVjZSBtb3JlIGRyaXZl
cnMgaW4gdGhlIGZ1dHVyZS4KPiAKPiBJIGRvbid0IHNlZSBob3cgdGhhdCBjb25uZWN0cyB3aXRo
IHVzaW5nIGEgYnVzLgo+IAo+IEV2ZXJ5IGNsYXNzIG9mIHZpcnRpbyB0cmFmZmljIGlzIGdvaW5n
IHRvIG5lZWQgYSBzcGVjaWFsIEhXIGRyaXZlciB0bwo+IGVuYWJsZSBWRFBBLCB0aGF0IHNwZWNp
YWwgZHJpdmVyIGNhbiBjcmVhdGUgdGhlIGNvcnJlY3Qgdmhvc3Qgc2lkZQo+IGNsYXNzIGRldmlj
ZS4KCgpUaGF0J3MganVzdCBhIHRvbiBvZiB1c2VsZXNzIGNvZGUgZHVwbGljYXRpb24sIGFuZCBh
IGdvb2QgY2hhbmNlCnRvIGhhdmUgbWlub3IgdmFyaWF0aW9ucyBpbiBpbXBsZW1lbnRhdGlvbnMg
Y29uZnVzaW5nCnVzZXJzcGFjZS4KCkluc3RlYWQsIGVhY2ggZGV2aWNlIGltcGxlbWVudCB0aGUg
c2FtZSBpbnRlcmZhY2UsIGFuZCB0aGVuCnZob3N0IHNpdHMgb24gdG9wLgoKPiA+ID4gRm9yIHRo
ZSBQQ0kgVkYgY2FzZSB0aGlzIGRyaXZlciB3b3VsZCBiaW5kIHRvIGEgUENJIGRldmljZSBsaWtl
Cj4gPiA+IGV2ZXJ5dGhpbmcgZWxzZQo+ID4gPiAKPiA+ID4gRm9yIG91ciBmdXR1cmUgU0YvQURJ
IGNhc2VzIHRoZSBkcml2ZXIgd291bGQgYmluZCB0byBzb21lCj4gPiA+IFNGL0FESS93aGF0ZXZl
ciBkZXZpY2Ugb24gYSBidXMuCj4gPiAKPiA+IEFsbCB0aGVzZSBkcml2ZXIgd2lsbCBzdGlsbCBi
ZSBib3VuZCB0byB0aGVpciBvd24gYnVzIChQQ0kgb3Igb3RoZXIpLiBBbmQKPiA+IHdoYXQgdGhl
IGRyaXZlciBuZWVkcyBpcyB0byBwcmVzZW50IGEgdkRQQSBkZXZpY2UgdG8gdmlydHVhbCB2RFBB
IGJ1cyBvbgo+ID4gdG9wLgo+IAo+IEFnYWluLCBJIGNhbid0IHNlZSBhbnkgcmVhc29uIHRvIGlu
amVjdCBhICd2ZHBhIHZpcnR1YWwgYnVzJyBvbgo+IHRvcC4gVGhhdCBzZWVtcyBsaWtlIG1pcy11
c2luZyB0aGUgZHJpdmVyIGNvcmUuCj4gCj4gSmFzb24KClRoYXQgYnVzIGlzIGV4YWN0bHkgd2hh
dCBHcmVnIEtIIHByb3Bvc2VkLiBUaGVyZSBhcmUgb3RoZXIgd2F5cwp0byBzb2x2ZSB0aGlzIEkg
Z3Vlc3MgYnV0IHRoaXMgYmlrZXNoZWRkaW5nIGlzIGdldHRpbmcgdGlyaW5nLgpDb21lIG9uIGl0
J3MgYW4gaW50ZXJuYWwga2VybmVsIGludGVyZmFjZSwgaWYgd2UgZmVlbAppdCB3YXMgYSB3cm9u
ZyBkaXJlY3Rpb24gdG8gdGFrZSB3ZSBjYW4gY2hhbmdlIG91ciBtaW5kcyBsYXRlci4KTWFpbiB0
aGluZyBpcyBnZXR0aW5nIFVBUEkgcmlnaHQuCgotLSAKTVNUCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
