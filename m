Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A919C38F
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:03:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3081320518;
	Thu,  2 Apr 2020 14:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJvmbScuu2SA; Thu,  2 Apr 2020 14:03:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D96D2203E2;
	Thu,  2 Apr 2020 14:03:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA8F6C07FF;
	Thu,  2 Apr 2020 14:03:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95EC7C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7CD39875D8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbngmsCrk1k6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 76EF4874E4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585836213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pW3IStRHotZHHVJbI4O500WA85Dxv8izDV7FvTI+lnk=;
 b=QCFGDXC1euDEXak/vabZe6s0rKJuHvz+ds1lpT/pxyfSwLnstzFs63tkXQGWBWIeS0V6/W
 /e3SrJB7+ccFLclBDpdGC6UwGtbsD9C4XmW6sUIEBaaOofzF69HJOT5OknEwSFkejc+JyS
 UELtwUsW4aI2HAZFzSY41Gjn5AMp+ds=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-1uWihH0LPLe7gEC5laE4oQ-1; Thu, 02 Apr 2020 10:03:31 -0400
X-MC-Unique: 1uWihH0LPLe7gEC5laE4oQ-1
Received: by mail-qk1-f198.google.com with SMTP id f206so3112915qke.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 07:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pW3IStRHotZHHVJbI4O500WA85Dxv8izDV7FvTI+lnk=;
 b=BK5hx0v/9Ui5KNAu8rNofirP+V0IdwW2kMbIxi174bYjkjegTiMv5mCvKjHRrS7bng
 9WYdiZ9qzDZgVM6MMasY/v7yYt6YmVeTT9/oocntnRvIVP2y/s5n1WsOnFK8aB82dHel
 vhJ06bsXmFhPheGhRkniz5eVrgEhsv1ILLevKu9wGWtZfnNGJpZNtpgSItH1gBqKrbij
 TcR/ijGAsBmhmVLOHRU7xH0ojRKk9ReWwBlTAO23yHZxs8aHjhvq2RuynfZtY0UwvFyE
 /ud2/TIWF2Ozw4Ea0ztX0IZlwEOYCStciOxh0LwYljH3+Mcg01h0709B7jHGKZvoKRPt
 KYbw==
X-Gm-Message-State: AGi0PuZfSWfZHl6JcRexj6P678VYgGtWiAj1ropF/oeOK+jdKGNdvD7s
 D+aCNRNdxQi7pvfxgA7NONorPOJxY+zXhBv/RkoODDbz5ibLlhs2CginBrRWtJQr8cUPngFYc9C
 IbbMHG9xoLIY63LfggZPywnTF/HK+JgDyFHkVMaC6uA==
X-Received: by 2002:ac8:32db:: with SMTP id a27mr3131772qtb.165.1585836211430; 
 Thu, 02 Apr 2020 07:03:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypLB2eqca8BJt9vk/5KptVL7bmZKMKTWTE9G9WXe57GBeZhOtApxHa3hrcRZ/Msl/M2CvDDzGA==
X-Received: by 2002:ac8:32db:: with SMTP id a27mr3131701qtb.165.1585836211041; 
 Thu, 02 Apr 2020 07:03:31 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h143sm3517147qke.58.2020.04.02.07.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 07:03:30 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:03:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
Message-ID: <20200402100257-mutt-send-email-mst@kernel.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <20200401092004-mutt-send-email-mst@kernel.org>
 <6b4d169a-9962-6014-5423-1507059343e9@redhat.com>
 <20200401100954-mutt-send-email-mst@kernel.org>
 <3dd3b7e7-e3d9-dba4-00fc-868081f95ab7@redhat.com>
 <20200401120643-mutt-send-email-mst@kernel.org>
 <c11c2195-88eb-2096-af47-40f2da5b389f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c11c2195-88eb-2096-af47-40f2da5b389f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

T24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMTE6MjI6NTdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMiDkuIrljYgxMjowOCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6Mjk6MzJQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gPkZyb20gOWIzYTVkMjNiOGJmNmIwYTExZTY1ZTY4ODMzNWQ3ODJmOGU2
YWE1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4KPiA+ID4gRGF0ZTogV2VkLCAxIEFwciAyMDIwIDIyOjE3OjI3ICsw
ODAwCj4gPiA+IFN1YmplY3Q6IFtQQVRDSF0gdmhvc3Q6IGxldCBDT05GSUdfVkhPU1QgdG8gYmUg
c2VsZWN0ZWQgYnkgZHJpdmVycwo+ID4gPiAKPiA+ID4gVGhlIGRlZmNvbmZpZyBvbiBzb21lIGFy
Y2hzIGVuYWJsZSB2aG9zdF9uZXQgb3Igdmhvc3RfdnNvY2sgYnkKPiA+ID4gZGVmYXVsdC4gU28g
aW5zdGVhZCBvZiBhZGRpbmcgQ09ORklHX1ZIT1NUPW0gdG8gYWxsIG9mIHRob3NlIGZpbGVzLAo+
ID4gPiBzaW1wbHkgbGV0dGluZyBDT05GSUdfVkhPU1QgdG8gYmUgc2VsZWN0ZWQgYnkgYWxsIG9m
IHRoZSB2aG9zdAo+ID4gPiBkcml2ZXJzLiBUaGlzIGZpeGVzIHRoZSBidWlsZCBvbiB0aGUgYXJj
aHMgd2l0aCBDT05GSUdfVkhPU1RfTkVUPW0gaW4KPiA+ID4gdGhlaXIgZGVmY29uZmlnLgo+ID4g
PiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4K
PiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVycy92aG9zdC9LY29uZmlnIHwgMTUgKysrKysrKysrKyst
LS0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9LY29uZmlnIGIvZHJp
dmVycy92aG9zdC9LY29uZmlnCj4gPiA+IGluZGV4IDI1MjNhMWQ0MjkwYS4uMzYyYjgzMmY1MzM4
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L0tjb25maWcKPiA+ID4gKysrIGIvZHJp
dmVycy92aG9zdC9LY29uZmlnCj4gPiA+IEBAIC0xMSwxOSArMTEsMjMgQEAgY29uZmlnIFZIT1NU
X1JJTkcKPiA+ID4gICAJICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdo
aWNoIG5lZWRzIHRvIGFjY2Vzcwo+ID4gPiAgIAkgIHRoZSBob3N0IHNpZGUgb2YgYSB2aXJ0aW8g
cmluZy4KPiA+ID4gLW1lbnVjb25maWcgVkhPU1QKPiA+ID4gLQl0cmlzdGF0ZSAiSG9zdCBrZXJu
ZWwgYWNjZWxlcmF0b3IgZm9yIHZpcnRpbyAoVkhPU1QpIgo+ID4gPiAtCWRlcGVuZHMgb24gRVZF
TlRGRAo+ID4gPiArY29uZmlnIFZIT1NUCj4gPiA+ICsJdHJpc3RhdGUKPiA+ID4gICAJc2VsZWN0
IFZIT1NUX0lPVExCCj4gPiA+ICAgCWhlbHAKPiA+ID4gICAJICBUaGlzIG9wdGlvbiBpcyBzZWxl
Y3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+ID4gPiAgIAkgIHRoZSBj
b3JlIG9mIHZob3N0Lgo+ID4gPiAtaWYgVkhPU1QKPiA+ID4gK21lbnVjb25maWcgVkhPU1RfTUVO
VQo+ID4gPiArCWJvb2wgIlZIT1NUIGRyaXZlcnMiCj4gPiA+ICsJZGVmYXVsdCB5Cj4gPiA+ICsK
PiA+ID4gK2lmIFZIT1NUX01FTlUKPiA+ID4gICBjb25maWcgVkhPU1RfTkVUCj4gPiA+ICAgCXRy
aXN0YXRlICJIb3N0IGtlcm5lbCBhY2NlbGVyYXRvciBmb3IgdmlydGlvIG5ldCIKPiA+ID4gICAJ
ZGVwZW5kcyBvbiBORVQgJiYgRVZFTlRGRCAmJiAoVFVOIHx8ICFUVU4pICYmIChUQVAgfHwgIVRB
UCkKPiA+ID4gKwlzZWxlY3QgVkhPU1QKPiA+ID4gICAJLS0taGVscC0tLQo+ID4gPiAgIAkgIFRo
aXMga2VybmVsIG1vZHVsZSBjYW4gYmUgbG9hZGVkIGluIGhvc3Qga2VybmVsIHRvIGFjY2VsZXJh
dGUKPiA+ID4gICAJICBndWVzdCBuZXR3b3JraW5nIHdpdGggdmlydGlvX25ldC4gTm90IHRvIGJl
IGNvbmZ1c2VkIHdpdGggdmlydGlvX25ldAo+ID4gPiBAQCAtMzUsNiArMzksNyBAQCBjb25maWcg
VkhPU1RfTkVUCj4gPiA+ICAgY29uZmlnIFZIT1NUX1NDU0kKPiA+ID4gICAJdHJpc3RhdGUgIlZI
T1NUX1NDU0kgVENNIGZhYnJpYyBkcml2ZXIiCj4gPiA+ICAgCWRlcGVuZHMgb24gVEFSR0VUX0NP
UkUgJiYgRVZFTlRGRAo+ID4gPiArCXNlbGVjdCBWSE9TVAo+ID4gPiAgIAlkZWZhdWx0IG4KPiA+
ID4gICAJLS0taGVscC0tLQo+ID4gPiAgIAlTYXkgTSBoZXJlIHRvIGVuYWJsZSB0aGUgdmhvc3Rf
c2NzaSBUQ00gZmFicmljIG1vZHVsZQo+ID4gPiBAQCAtNDMsNiArNDgsNyBAQCBjb25maWcgVkhP
U1RfU0NTSQo+ID4gPiAgIGNvbmZpZyBWSE9TVF9WU09DSwo+ID4gPiAgIAl0cmlzdGF0ZSAidmhv
c3QgdmlydGlvLXZzb2NrIGRyaXZlciIKPiA+ID4gICAJZGVwZW5kcyBvbiBWU09DS0VUUyAmJiBF
VkVOVEZECj4gPiA+ICsJc2VsZWN0IFZIT1NUCj4gPiA+ICAgCXNlbGVjdCBWSVJUSU9fVlNPQ0tF
VFNfQ09NTU9OCj4gPiA+ICAgCWRlZmF1bHQgbgo+ID4gPiAgIAktLS1oZWxwLS0tCj4gPiA+IEBA
IC01Niw2ICs2Miw3IEBAIGNvbmZpZyBWSE9TVF9WU09DSwo+ID4gPiAgIGNvbmZpZyBWSE9TVF9W
RFBBCj4gPiA+ICAgCXRyaXN0YXRlICJWaG9zdCBkcml2ZXIgZm9yIHZEUEEtYmFzZWQgYmFja2Vu
ZCIKPiA+ID4gICAJZGVwZW5kcyBvbiBFVkVOVEZECj4gPiA+ICsJc2VsZWN0IFZIT1NUCj4gCj4g
Cj4gVGhpcyBwYXJ0IGlzIG5vdCBzcXVhc2hlZC4KPiAKPiAKPiA+ID4gICAJc2VsZWN0IFZEUEEK
PiA+ID4gICAJaGVscAo+ID4gPiAgIAkgIFRoaXMga2VybmVsIG1vZHVsZSBjYW4gYmUgbG9hZGVk
IGluIGhvc3Qga2VybmVsIHRvIGFjY2VsZXJhdGUKPiA+IE9LIHNvIEkgc3F1YXNoZWQgdGhpcyBp
bnRvIHRoZSBvcmlnaW5hbCBidWdneSBwYXRjaC4KPiA+IENvdWxkIHlvdSBwbGVhc2UgcGxheSB3
aXRoIHZob3N0IGJyYW5jaCBvZiBteSB0cmVlIG9uIHZhcmlvdXMKPiA+IGFyY2hlcz8gSWYgaXQg
bG9va3Mgb2sgdG8geW91IGxldCBtZSBrbm93IEknbGwgcHVzaAo+ID4gdGhpcyB0byBuZXh0Lgo+
IAo+IAo+IFdpdGggdGhlIGFib3ZlIHBhcnQgc3F1YXNoZWQuIEkndmUgdGVzdGVkIGFsbCB0aGUg
YXJjaHMgd2hvc2UgZGVmY29uZmlnIGhhdmUKPiBWSE9TVF9ORVQgb3IgVkhPU1RfVlNPQ0sgZW5h
YmxlZC4KPiAKPiBBbGwgbG9va3MgZmluZS4KPiAKPiBUaGFua3MKCgpJJ20gYSBiaXQgY29uZnVz
ZWQuIFNvIGlzIHRoZSBuZXh0IHRhZyBpbiBteSB0cmVlIG9rIG5vdz8KCi0tIApNU1QKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
