Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C419AD4D
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:01:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 999B5203CE;
	Wed,  1 Apr 2020 14:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Uu1t56Ucc2J; Wed,  1 Apr 2020 14:01:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6B2292040E;
	Wed,  1 Apr 2020 14:01:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53D10C089F;
	Wed,  1 Apr 2020 14:01:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7134C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A19488796C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Newsnb8Z1Myx
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:01:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4BFE787850
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585749695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTgkw/DNWNFnGK1V1mn43DeF8IkK7OE1WypLeTHLQVQ=;
 b=GyDvtzxgdJe+NPo3SEjtIIeob7qke8JOdWOTN6yrCmOrAJJQCaamHpD32LB7fnhppxdtRP
 vrT1CItyR7CVx2RtVvweQfbYDFNTfCPObT6BUunWfPgq8WdcRwK1qxzkcqtJAGVbDvlEIR
 tMwYkVpdoBB2EJT8T06PiMFdbRQB1Ic=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-pCDLW2RhNH29GxKQiGvoGA-1; Wed, 01 Apr 2020 10:01:33 -0400
X-MC-Unique: pCDLW2RhNH29GxKQiGvoGA-1
Received: by mail-wr1-f71.google.com with SMTP id u16so11639660wrp.14
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 07:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JTgkw/DNWNFnGK1V1mn43DeF8IkK7OE1WypLeTHLQVQ=;
 b=XQb1gXJQxHN+9wTM4i2NOERzQNpB4HhgIQgy5yET/fjeBHpnOE3VlIjAhLtMv2EuRm
 WRC/kbODazO4GrCJUMfvIE4njmIzjDJ6P0eecsYOfhvr/nvi+G7FRh3MTenBdFqznMIA
 rpBm8IKsldZZBCk0l00Zcv6b+pVJpQUXoSXYR3l0d8IRb+BtIJ41lEzWhg2QVlHas3yF
 s8NvvF+HJ7LAbFIDGqebpvMoVz6CLq+MTaV6slgEv2Z9sTg4F2/O1LyyJx+r2PjZTzp7
 s77R2zQBhEc2GgleHHkKq5/AUIM+Xutb5/bfmzgp69/LoamtV7vnZacYrqZOKBjidmbt
 F2eA==
X-Gm-Message-State: ANhLgQ1e+bIyp7bYuQXBYUwOWHVrPL69UY4OMXoeJYkp4HQfsZ9NmbDr
 uqNA+SUat/AxXiDW7leMA4O2XiwUx7bf4At7mpIfCXRxPdKYfEjGc8f32huez4Tys5H1pLna+NF
 F9a8hBBjUmKKKAG82drx4WgBq3caZ25/9/4j++sy2ZA==
X-Received: by 2002:adf:9321:: with SMTP id 30mr24990274wro.330.1585749692209; 
 Wed, 01 Apr 2020 07:01:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsFbKox39mO56Wdb4IkMUuB5u4BTlW+FZYATXuysnk2/9j76LmESJqT/c2PrF73AgslT1nk9A==
X-Received: by 2002:adf:9321:: with SMTP id 30mr24990241wro.330.1585749691892; 
 Wed, 01 Apr 2020 07:01:31 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id 98sm3113112wrk.52.2020.04.01.07.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 07:01:31 -0700 (PDT)
Date: Wed, 1 Apr 2020 10:01:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
Message-ID: <20200401095820-mutt-send-email-mst@kernel.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
 <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
 <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, saugatm@xilinx.com, lulu@redhat.com,
 hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com, jgg@mellanox.com,
 mhabets@solarflare.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 netdev@vger.kernel.org, lingshan.zhu@intel.com
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

T24gV2VkLCBBcHIgMDEsIDIwMjAgYXQgMDM6MDI6MDBQTSArMDIwMCwgQ2hyaXN0aWFuIEJvcm50
cmFlZ2VyIHdyb3RlOgo+IAo+IAo+IE9uIDAxLjA0LjIwIDE0OjU2LCBDaHJpc3RpYW4gQm9ybnRy
YWVnZXIgd3JvdGU6Cj4gPiAKPiA+IE9uIDAxLjA0LjIwIDE0OjUwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+ID4+Cj4gPj4gT24gMjAyMC80LzEg5LiL5Y2INzoyMSwgQ2hyaXN0aWFuIEJvcm50cmFlZ2Vy
IHdyb3RlOgo+ID4+PiBPbiAyNi4wMy4yMCAxNTowMSwgSmFzb24gV2FuZyB3cm90ZToKPiA+Pj4+
IEN1cnJlbnRseSwgQ09ORklHX1ZIT1NUIGRlcGVuZHMgb24gQ09ORklHX1ZJUlRVQUxJWkFUSU9O
LiBCdXQgdmhvc3QgaXMKPiA+Pj4+IG5vdCBuZWNlc3NhcmlseSBmb3IgVk0gc2luY2UgaXQncyBh
IGdlbmVyaWMgdXNlcnNwYWNlIGFuZCBrZXJuZWwKPiA+Pj4+IGNvbW11bmljYXRpb24gcHJvdG9j
b2wuIFN1Y2ggZGVwZW5kZW5jeSBtYXkgcHJldmVudCBhcmNocyB3aXRob3V0Cj4gPj4+PiB2aXJ0
dWFsaXphdGlvbiBzdXBwb3J0IGZyb20gdXNpbmcgdmhvc3QuCj4gPj4+Pgo+ID4+Pj4gVG8gc29s
dmUgdGhpcywgYSBkZWRpY2F0ZWQgdmhvc3QgbWVudSBpcyBjcmVhdGVkIHVuZGVyIGRyaXZlcnMg
c28KPiA+Pj4+IENPTklGR19WSE9TVCBjYW4gYmUgZGVjb3VwbGVkIG91dCBvZiBDT05GSUdfVklS
VFVBTElaQVRJT04uCj4gPj4+IEZXSVcsIHRoaXMgbm93IHJlc3VsdHMgaW4gdmhvc3Qgbm90IGJl
aW5nIGJ1aWxkIHdpdGggZGVmY29uZmlnIGtlcm5lbHMgKGluIHRvZGF5cwo+ID4+PiBsaW51eC1u
ZXh0KS4KPiA+Pj4KPiA+Pgo+ID4+IEhpIENocmlzdGlhbjoKPiA+Pgo+ID4+IERpZCB5b3UgbWVl
dCBpdCBldmVuIHdpdGggdGhpcyBjb21taXTCoGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD1hNGJlNDBj
YmNlZGJhOWI1YjcxNGYzYzk1MTgyZThhNDUxNzZlNDJkPwo+ID4gCj4gPiBJIHNpbXBseSB1c2Vk
IGxpbnV4LW5leHQuIFRoZSBkZWZjb25maWcgZG9lcyBOT1QgY29udGFpbiBDT05GSUdfVkhPU1Qg
YW5kIHRoZXJlZm9yZSBDT05GSUdfVkhPU1RfTkVUIGFuZCBmcmllbmRzCj4gPiBjYW4gbm90IGJl
IHNlbGVjdGVkLgo+ID4gCj4gPiAkIGdpdCBjaGVja291dCBuZXh0LTIwMjAwNDAxCj4gPiAkIG1h
a2UgZGVmY29uZmlnCj4gPiAgIEhPU1RDQyAgc2NyaXB0cy9iYXNpYy9maXhkZXAKPiA+ICAgSE9T
VENDICBzY3JpcHRzL2tjb25maWcvY29uZi5vCj4gPiAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmln
L2NvbmZkYXRhLm8KPiA+ICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvZXhwci5vCj4gPiAgIExF
WCAgICAgc2NyaXB0cy9rY29uZmlnL2xleGVyLmxleC5jCj4gPiAgIFlBQ0MgICAgc2NyaXB0cy9r
Y29uZmlnL3BhcnNlci50YWIuW2NoXQo+ID4gICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9sZXhl
ci5sZXgubwo+ID4gICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9wYXJzZXIudGFiLm8KPiA+ICAg
SE9TVENDICBzY3JpcHRzL2tjb25maWcvcHJlcHJvY2Vzcy5vCj4gPiAgIEhPU1RDQyAgc2NyaXB0
cy9rY29uZmlnL3N5bWJvbC5vCj4gPiAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL3V0aWwubwo+
ID4gICBIT1NUTEQgIHNjcmlwdHMva2NvbmZpZy9jb25mCj4gPiAqKiogRGVmYXVsdCBjb25maWd1
cmF0aW9uIGlzIGJhc2VkIG9uICd4ODZfNjRfZGVmY29uZmlnJwo+ID4gIwo+ID4gIyBjb25maWd1
cmF0aW9uIHdyaXR0ZW4gdG8gLmNvbmZpZwo+ID4gIwo+ID4gCj4gPiAkIGdyZXAgVkhPU1QgLmNv
bmZpZwo+ID4gIyBDT05GSUdfVkhPU1QgaXMgbm90IHNldAo+ID4gCj4gPiAgCj4gPj4gSWYgeWVz
LCB3aGF0J3MgeW91ciBidWlsZCBjb25maWcgbG9va3MgbGlrZT8KPiA+Pgo+ID4+IFRoYW5rcwo+
IAo+IFRoaXMgd2FzIHg4Ni4gTm90IHN1cmUgaWYgdGhhdCBkaWQgd29yayBiZWZvcmUuCj4gT24g
czM5MCB0aGlzIGlzIGRlZmluaXRlbHkgYSByZWdyZXNzaW9uIGFzIHRoZSBkZWZjb25maWcgZmls
ZXMgCj4gZm9yIHMzOTAgZG8gc2VsZWN0IFZIT1NUX05FVAo+IAo+IGdyZXAgVkhPU1QgYXJjaC9z
MzkwL2NvbmZpZ3MvKgo+IGFyY2gvczM5MC9jb25maWdzL2RlYnVnX2RlZmNvbmZpZzpDT05GSUdf
VkhPU1RfTkVUPW0KPiBhcmNoL3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWc6Q09ORklHX1ZI
T1NUX1ZTT0NLPW0KPiBhcmNoL3MzOTAvY29uZmlncy9kZWZjb25maWc6Q09ORklHX1ZIT1NUX05F
VD1tCj4gYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnOkNPTkZJR19WSE9TVF9WU09DSz1tCj4g
Cj4gYW5kIHRoaXMgd29ya2VkIHdpdGggNS42LCBidXQgZG9lcyBub3Qgd29yayB3aXRoIG5leHQu
IEp1c3QgYWRkaW5nCj4gQ09ORklHX1ZIT1NUPW0gdG8gdGhlIGRlZmNvbmZpZyBzb2x2ZXMgdGhl
IGlzc3VlLCBzb21ldGhpbmcgbGlrZQoKQW5kIGEgYnVuY2ggb2Ygb3RoZXIgcGxhY2VzIEkgZ3Vl
c3MuLi4gYW5kIEkgZ3Vlc3Mgd2UgbmVlZCB0bwpzZWxlY3QgVkhPU1RfUklORyB0b28/CkFsc28g
SmFzb24sIEkganVzdCBub3RpY2VkIHRoYXQgeW91IGFkZGVkOgoKY29uZmlnIFZIT1NUX1JJTkcK
ICAgICAgICB0cmlzdGF0ZQorICAgICAgICBzZWxlY3QgVkhPU1RfSU9UTEIKICAgICAgICBoZWxw
CiAgICAgICAgICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5l
ZWRzIHRvIGFjY2VzcwogICAgICAgICAgdGhlIGhvc3Qgc2lkZSBvZiBhIHZpcnRpbyByaW5nLgoK
YnV0IGFyZSB5b3Ugc3VyZSB0aGlzIHdpbGwgZG8gdGhlIHJpZ2h0IHRoaW5nIGlmIFZIT1NUX1JJ
TkcgaXRzZWxmCnNlbGVjdGVkPwoKCj4gLS0tCj4gIGFyY2gvczM5MC9jb25maWdzL2RlYnVnX2Rl
ZmNvbmZpZyB8IDUgKysrLS0KPiAgYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnICAgICAgIHwg
NSArKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnIGIv
YXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnCj4gaW5kZXggNDYwMzhiYzU4YzllLi4w
YjgzMjc0MzQxY2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29u
ZmlnCj4gKysrIGIvYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnCj4gQEAgLTU3LDgg
KzU3LDYgQEAgQ09ORklHX1BST1RFQ1RFRF9WSVJUVUFMSVpBVElPTl9HVUVTVD15Cj4gIENPTkZJ
R19DTU09bQo+ICBDT05GSUdfQVBQTERBVEFfQkFTRT15Cj4gIENPTkZJR19LVk09bQo+IC1DT05G
SUdfVkhPU1RfTkVUPW0KPiAtQ09ORklHX1ZIT1NUX1ZTT0NLPW0KPiAgQ09ORklHX09QUk9GSUxF
PW0KPiAgQ09ORklHX0tQUk9CRVM9eQo+ICBDT05GSUdfSlVNUF9MQUJFTD15Cj4gQEAgLTU2MSw2
ICs1NTksOSBAQCBDT05GSUdfVkZJT19NREVWX0RFVklDRT1tCj4gIENPTkZJR19WSVJUSU9fUENJ
PW0KPiAgQ09ORklHX1ZJUlRJT19CQUxMT09OPW0KPiAgQ09ORklHX1ZJUlRJT19JTlBVVD15Cj4g
K0NPTkZJR19WSE9TVD1tCj4gK0NPTkZJR19WSE9TVF9ORVQ9bQo+ICtDT05GSUdfVkhPU1RfVlNP
Q0s9bQo+ICBDT05GSUdfUzM5MF9DQ1dfSU9NTVU9eQo+ICBDT05GSUdfUzM5MF9BUF9JT01NVT15
Cj4gIENPTkZJR19FWFQ0X0ZTPXkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2NvbmZpZ3MvZGVm
Y29uZmlnIGIvYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnCj4gaW5kZXggN2NkMDY0OGMxZjRl
Li4zOWU2OWM0ZThjZjcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmln
Cj4gKysrIGIvYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnCj4gQEAgLTU3LDggKzU3LDYgQEAg
Q09ORklHX1BST1RFQ1RFRF9WSVJUVUFMSVpBVElPTl9HVUVTVD15Cj4gIENPTkZJR19DTU09bQo+
ICBDT05GSUdfQVBQTERBVEFfQkFTRT15Cj4gIENPTkZJR19LVk09bQo+IC1DT05GSUdfVkhPU1Rf
TkVUPW0KPiAtQ09ORklHX1ZIT1NUX1ZTT0NLPW0KPiAgQ09ORklHX09QUk9GSUxFPW0KPiAgQ09O
RklHX0tQUk9CRVM9eQo+ICBDT05GSUdfSlVNUF9MQUJFTD15Cj4gQEAgLTU1Nyw2ICs1NTUsOSBA
QCBDT05GSUdfVkZJT19NREVWX0RFVklDRT1tCj4gIENPTkZJR19WSVJUSU9fUENJPW0KPiAgQ09O
RklHX1ZJUlRJT19CQUxMT09OPW0KPiAgQ09ORklHX1ZJUlRJT19JTlBVVD15Cj4gK0NPTkZJR19W
SE9TVD1tCj4gK0NPTkZJR19WSE9TVF9ORVQ9bQo+ICtDT05GSUdfVkhPU1RfVlNPQ0s9bQo+ICBD
T05GSUdfUzM5MF9DQ1dfSU9NTVU9eQo+ICBDT05GSUdfUzM5MF9BUF9JT01NVT15Cj4gIENPTkZJ
R19FWFQ0X0ZTPXkKPiAtLSAKPiAyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
