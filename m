Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 299A8532E28
	for <lists.virtualization@lfdr.de>; Tue, 24 May 2022 18:01:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA62540C25;
	Tue, 24 May 2022 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7t7ITIf15sQ; Tue, 24 May 2022 16:01:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2876B40BFB;
	Tue, 24 May 2022 16:01:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A03F0C007E;
	Tue, 24 May 2022 16:01:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D726C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 May 2022 16:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 070E0824CE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 May 2022 16:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3tc7bclK0vd
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 May 2022 16:01:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03F1682446
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 May 2022 16:01:36 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-f1d5464c48so22787402fac.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 May 2022 09:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6jzGflikaNvQlRBg9TN37pKT3uRBxsEEX4IWek2qFQw=;
 b=TaznYb/mQpxuXVKQcQ1Pr8UwaaayixpP5Q9i0+FO+6D2yKhcSEhoM0/30jIJwZ5s6G
 pEtCDcVbSiyvwWIvzE1A0zWTC8ZZMXgBqaLmBoWK+lsJBNKjFmk9cLscvMJZYiSVfwfJ
 p+HgR4M3OkKTpcSI/kANK1sA8FWIEehXCkP5xkjGTR8Ipko5BeRllAp+75rYjkz9QiZ6
 sTuzVgvuuGSMM1BHjj9hpu7kVp+HL/ZdhDlAsAQnGN8fohbav0KZUs17kVfGDmT/xg14
 XPrVejx8r1WaZInhv2b0XSKNoI6L1mIIQb7gJFhC1gBa9M6ayU+p/NAbvbeYBNEMWAcZ
 G9Eg==
X-Gm-Message-State: AOAM530eYkCl/8YVuIIaCEYLyLVwcIGrkpMZDfsNg12la92Na0WJ/TbD
 d3FGqDLxZ8JxWMteVLdQnA==
X-Google-Smtp-Source: ABdhPJzH8Fdg6RlKojwWxDTyu4yBCyschwGc8rMrHO3T48dxy5qyReCvUbV6SsubRECLF0EBuNxexg==
X-Received: by 2002:a05:6870:a40a:b0:f1:9240:2776 with SMTP id
 m10-20020a056870a40a00b000f192402776mr2835469oal.140.1653408095924; 
 Tue, 24 May 2022 09:01:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s12-20020a0568301c6c00b006060322125esm5217753otg.46.2022.05.24.09.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 09:01:35 -0700 (PDT)
Received: (nullmailer pid 3883217 invoked by uid 1000);
 Tue, 24 May 2022 16:01:34 -0000
Date: Tue, 24 May 2022 11:01:34 -0500
From: Rob Herring <robh@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
Message-ID: <20220524160134.GE3730540-robh@kernel.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
 <CAK8P3a2cAnXr8TDDYTiFxTWzQxa67sGnYDQRRD+=Q8_cSb1mEw@mail.gmail.com>
 <56e8c32d-6771-7179-005f-26ca58555659@gmail.com>
 <CAK8P3a1YhkEZ8gcbXHEa5Bwx-4VVRJO8SUHf8=RNWRsc2Yo-+A@mail.gmail.com>
 <460a746c-6b61-214b-4653-44a1430e314d@gmail.com>
 <alpine.DEB.2.22.394.2205181802310.1905099@ubuntu-linux-20-04-desktop>
 <6f469e9c-c26e-f4be-9a85-710afb0d77eb@gmail.com>
 <390ba7bb-ee9e-b7b7-5f08-71a7245fa4ec@gmail.com>
 <alpine.DEB.2.22.394.2205231856330.1905099@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2205231856330.1905099@ubuntu-linux-20-04-desktop>
Cc: Juergen Gross <jgross@suse.com>, DTML <devicetree@vger.kernel.org>,
 Julien Grall <julien@xen.org>, Arnd Bergmann <arnd@arndb.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Oleksandr <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

K1NhcmF2YW5hCgpPbiBNb24sIE1heSAyMywgMjAyMiBhdCAwNjo1ODoxM1BNIC0wNzAwLCBTdGVm
YW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gTW9uLCAyMyBNYXkgMjAyMiwgT2xla3NhbmRyIHdy
b3RlOgo+ID4gPiA+IE9uIFRodSwgMTkgTWF5IDIwMjIsIE9sZWtzYW5kciB3cm90ZToKPiA+ID4g
PiA+ID4gT24gV2VkLCBNYXkgMTgsIDIwMjIgYXQgNTowNiBQTSBPbGVrc2FuZHIgPG9sZWtzdHlz
aEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIDE4LjA1LjIyIDE3OjMyLCBBcm5k
IEJlcmdtYW5uIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gU2F0LCBNYXkgNywgMjAyMiBhdCA3
OjE5IFBNIE9sZWtzYW5kciBUeXNoY2hlbmtvCj4gPiA+ID4gPiA+ID4gPiA8b2xla3N0eXNoQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiDCoMKgwqAgVGhpcyB3b3VsZCBtZWFuIGhh
dmluZyBhIGRldmljZQo+ID4gPiA+ID4gPiA+ID4gbm9kZSBmb3IgdGhlIGdyYW50LXRhYmxlIG1l
Y2hhbmlzbSB0aGF0IGNhbiBiZSByZWZlcnJlZCB0byB1c2luZwo+ID4gPiA+ID4gPiA+ID4gdGhl
Cj4gPiA+ID4gPiA+ID4gPiAnaW9tbXVzJwo+ID4gPiA+ID4gPiA+ID4gcGhhbmRsZSBwcm9wZXJ0
eSwgd2l0aCB0aGUgZG9taWQgYXMgYW4gYWRkaXRpb25hbCBhcmd1bWVudC4KPiA+ID4gPiA+ID4g
PiBJIGFzc3VtZSwgeW91IGFyZSBzcGVha2luZyBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGUgZm9s
bG93aW5nPwo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IHhlbl9k
dW1teV9pb21tdSB7Cj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInhlbixk
dW1teS1pb21tdSI7Cj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoCAjaW9tbXUtY2VsbHMgPSA8MT47
Cj4gPiA+ID4gPiA+ID4gfTsKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiB2aXJ0aW9AMzAw
MCB7Cj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInZpcnRpbyxtbWlvIjsK
PiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgIHJlZyA9IDwweDMwMDAgMHgxMDA+Owo+ID4gPiA+ID4g
PiA+IMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDw0MT47Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gwqDCoMKgwqDCoCAvKiBUaGUgZGV2aWNlIGlzIGxvY2F0ZWQgaW4gWGVuIGRvbWFpbiB3
aXRoIElEIDEgKi8KPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgIGlvbW11cyA9IDwmeGVuX2R1bW15
X2lvbW11IDE+Owo+ID4gPiA+ID4gPiA+IH07Cj4gPiA+ID4gPiA+IFJpZ2h0LCB0aGF0J3MgdGhh
dCdzIHRoZSBpZGVhLAo+ID4gPiA+ID4gdGhhbmsgeW91IGZvciB0aGUgY29uZmlybWF0aW9uCj4g
PiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IMKgwqAgZXhjZXB0IEkg
d291bGQgbm90IGNhbGwgaXQgYSAnZHVtbXknLgo+ID4gPiA+ID4gPiDCoCBGcm9tIHRoZSBwZXJz
cGVjdGl2ZSBvZiB0aGUgRFQsIHRoaXMgYmVoYXZlcyBqdXN0IGxpa2UgYW4gSU9NTVUsCj4gPiA+
ID4gPiA+IGV2ZW4gaWYgdGhlIGV4YWN0IG1lY2hhbmlzbSBpcyBkaWZmZXJlbnQgZnJvbSBtb3N0
IGhhcmR3YXJlIElPTU1VCj4gPiA+ID4gPiA+IGltcGxlbWVudGF0aW9ucy4KPiA+ID4gPiA+IHdl
bGwsIGFncmVlCj4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gSXQgZG9lcyBu
b3QgcXVpdGUgZml0IHRoZSBtb2RlbCB0aGF0IExpbnV4IGN1cnJlbnRseSB1c2VzIGZvcgo+ID4g
PiA+ID4gPiA+ID4gaW9tbXVzLAo+ID4gPiA+ID4gPiA+ID4gYXMgdGhhdCBoYXMgYW4gYWxsb2Nh
dG9yIGZvciBkbWFfYWRkcl90IHNwYWNlCj4gPiA+ID4gPiA+ID4geWVzICgjIDMvNyBhZGRzIGdy
YW50LXRhYmxlIGJhc2VkIGFsbG9jYXRvcikKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiA+ICwgYnV0IGl0IHdvdWxkIHRoaW5rIGl0J3MKPiA+ID4gPiA+ID4gPiA+
IGNvbmNlcHR1YWxseSBjbG9zZSBlbm91Z2ggdGhhdCBpdCBtYWtlcyBzZW5zZSBmb3IgdGhlIGJp
bmRpbmcuCj4gPiA+ID4gPiA+ID4gSW50ZXJlc3RpbmcgaWRlYS4gSSBhbSB3b25kZXJpbmcsIGRv
IHdlIG5lZWQgYW4gZXh0cmEgYWN0aW9ucyBmb3IKPiA+ID4gPiA+ID4gPiB0aGlzCj4gPiA+ID4g
PiA+ID4gdG8gd29yayBpbiBMaW51eCBndWVzdCAoZHVtbXkgSU9NTVUgZHJpdmVyLCBldGMpPwo+
ID4gPiA+ID4gPiBJdCBkZXBlbmRzIG9uIGhvdyBjbG9zZWx5IHRoZSBndWVzdCBpbXBsZW1lbnRh
dGlvbiBjYW4gYmUgbWFkZSB0bwo+ID4gPiA+ID4gPiByZXNlbWJsZSBhIG5vcm1hbCBpb21tdS4g
SWYgeW91IGRvIGFsbG9jYXRlIGRtYV9hZGRyX3QgYWRkcmVzc2VzLAo+ID4gPiA+ID4gPiBpdCBt
YXkgYWN0dWFsbHkgYmUgY2xvc2UgZW5vdWdoIHRoYXQgeW91IGNhbiBqdXN0IHR1cm4gdGhlIGdy
YW50LXRhYmxlCj4gPiA+ID4gPiA+IGNvZGUgaW50byBhIG5vcm1hbCBpb21tdSBkcml2ZXIgYW5k
IGNoYW5nZSBub3RoaW5nIGVsc2UuCj4gPiA+ID4gPiBVbmZvcnR1bmF0ZWx5LCBJIGZhaWxlZCB0
byBmaW5kIGEgd2F5IGhvdyB1c2UgZ3JhbnQgcmVmZXJlbmNlcyBhdCB0aGUKPiA+ID4gPiA+IGlv
bW11X29wcyBsZXZlbCAoSSBtZWFuIHRvIGZ1bGx5IHByZXRlbmQgdGhhdCB3ZSBhcmUgYW4gSU9N
TVUgZHJpdmVyKS4gSQo+ID4gPiA+ID4gYW0KPiA+ID4gPiA+IG5vdCB0b28gZmFtaWxpYXIgd2l0
aCB0aGF0LCBzbyB3aGF0IGlzIHdyaXR0ZW4gYmVsb3cgbWlnaHQgYmUgd3Jvbmcgb3IKPiA+ID4g
PiA+IGF0Cj4gPiA+ID4gPiBsZWFzdCBub3QgcHJlY2lzZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4g
VGhlIG5vcm1hbCBJT01NVSBkcml2ZXIgaW4gTGludXggZG9lc27igJl0IGFsbG9jYXRlIERNQSBh
ZGRyZXNzZXMgYnkKPiA+ID4gPiA+IGl0c2VsZiwgaXQKPiA+ID4gPiA+IGp1c3QgbWFwcyAoSU9W
QS1QQSkgd2hhdCB3YXMgcmVxdWVzdGVkIHRvIGJlIG1hcHBlZCBieSB0aGUgdXBwZXIgbGF5ZXIu
Cj4gPiA+ID4gPiBUaGUKPiA+ID4gPiA+IERNQSBhZGRyZXNzIGFsbG9jYXRpb24gaXMgZG9uZSBi
eSB0aGUgdXBwZXIgbGF5ZXIgKERNQS1JT01NVSB3aGljaCBpcwo+ID4gPiA+ID4gdGhlIGdsdWUK
PiA+ID4gPiA+IGxheWVyIGJldHdlZW4gRE1BIEFQSSBhbmQgSU9NTVUgQVBJIGFsbG9jYXRlcyBJ
T1ZBIGZvciBQQT8pLiBCdXQsIGFsbAo+ID4gPiA+ID4gd2hhdCB3ZQo+ID4gPiA+ID4gbmVlZCBo
ZXJlIGlzIGp1c3QgdG8gYWxsb2NhdGUgb3VyIHNwZWNpZmljIGdyYW50LXRhYmxlIGJhc2VkIERN
QQo+ID4gPiA+ID4gYWRkcmVzc2VzCj4gPiA+ID4gPiAoRE1BIGFkZHJlc3MgPSBncmFudCByZWZl
cmVuY2UgKyBvZmZzZXQgaW4gdGhlIHBhZ2UpLCBzbyBsZXTigJlzIHNheSB3ZQo+ID4gPiA+ID4g
bmVlZCBhbgo+ID4gPiA+ID4gZW50aXR5IHRvIHRha2UgYSBwaHlzaWNhbCBhZGRyZXNzIGFzIHBh
cmFtZXRlciBhbmQgcmV0dXJuIGEgRE1BIGFkZHJlc3MKPiA+ID4gPiA+ICh3aGF0Cj4gPiA+ID4g
PiBhY3R1YWxseSBjb21taXQgIzMvNyBpcyBkb2luZyksIGFuZCB0aGF04oCZcyBhbGwuIFNvIHdv
cmtpbmcgYXQgdGhlCj4gPiA+ID4gPiBkbWFfb3BzCj4gPiA+ID4gPiBsYXllciB3ZSBnZXQgZXhh
Y3RseSB3aGF0IHdlIG5lZWQsIHdpdGggdGhlIG1pbmltYWwgY2hhbmdlcyB0byBndWVzdAo+ID4g
PiA+ID4gaW5mcmFzdHJ1Y3R1cmUuIEluIG91ciBjYXNlIHRoZSBYZW4gaXRzZWxmIGFjdHMgYXMg
YW4gSU9NTVUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFzc3VtaW5nIHRoYXQgd2Ugd2FudCB0byBy
ZXVzZSB0aGUgSU9NTVUgaW5mcmFzdHJ1Y3R1cmUgc29tZWhvdyBmb3Igb3VyCj4gPiA+ID4gPiBu
ZWVkcy4KPiA+ID4gPiA+IEkgdGhpbmssIGluIHRoYXQgY2FzZSB3ZSB3aWxsIGxpa2VseSBuZWVk
IHRvIGludHJvZHVjZSBhIG5ldyBzcGVjaWZpYwo+ID4gPiA+ID4gSU9WQQo+ID4gPiA+ID4gYWxs
b2NhdG9yIChhbG9uZ3NpZGUgd2l0aCBhIGdlbmVyaWMgb25lKSB0byBiZSBob29rZWQgdXAgYnkg
dGhlCj4gPiA+ID4gPiBETUEtSU9NTVUKPiA+ID4gPiA+IGxheWVyIGlmIHdlIHJ1biBvbiB0b3Ag
b2YgWGVuLiBCdXQsIGV2ZW4gaGF2aW5nIHRoZSBzcGVjaWZpYyBJT1ZBCj4gPiA+ID4gPiBhbGxv
Y2F0b3IgdG8KPiA+ID4gPiA+IHJldHVybiB3aGF0IHdlIGluZGVlZCBuZWVkIChETUEgYWRkcmVz
cyA9IGdyYW50IHJlZmVyZW5jZSArIG9mZnNldCBpbgo+ID4gPiA+ID4gdGhlCj4gPiA+ID4gPiBw
YWdlKSB3ZSB3aWxsIHN0aWxsIG5lZWQgdGhlIHNwZWNpZmljIG1pbmltYWwgcmVxdWlyZWQgSU9N
TVUgZHJpdmVyIHRvCj4gPiA+ID4gPiBiZQo+ID4gPiA+ID4gcHJlc2VudCBpbiB0aGUgc3lzdGVt
IGFueXdheSBpbiBvcmRlciB0byB0cmFjayB0aGUgbWFwcGluZ3MoPykgYW5kIGRvCj4gPiA+ID4g
PiBub3RoaW5nCj4gPiA+ID4gPiB3aXRoIHRoZW0sIHJldHVybmluZyBhIHN1Y2Nlc3MgKHRoaXMg
c3BlY2lmaWMgSU9NTVUgZHJpdmVyIHNob3VsZCBoYXZlCj4gPiA+ID4gPiBhbGwKPiA+ID4gPiA+
IG1hbmRhdG9yeSBjYWxsYmFja3MgaW1wbGVtZW50ZWQpLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJ
IGNvbXBsZXRlbHkgYWdyZWUsIGl0IHdvdWxkIGJlIHJlYWxseSBuaWNlIHRvIHJldXNlIGdlbmVy
aWMgSU9NTVUKPiA+ID4gPiA+IGJpbmRpbmdzCj4gPiA+ID4gPiByYXRoZXIgdGhhbiBpbnRyb2R1
Y2luZyBYZW4gc3BlY2lmaWMgcHJvcGVydHkgaWYgd2hhdCB3ZSBhcmUgdHJ5aW5nIHRvCj4gPiA+
ID4gPiBpbXBsZW1lbnQgaW4gY3VycmVudCBwYXRjaCBzZXJpZXMgZml0cyBpbiB0aGUgdXNhZ2Ug
b2YgImlvbW11cyIgaW4gTGludXgKPiA+ID4gPiA+IG1vcmUtbGVzcy4gQnV0LCBpZiB3ZSB3aWxs
IGhhdmUgdG8gYWRkIG1vcmUgY29tcGxleGl0eS9tb3JlIGNvbXBvbmVudHMKPiA+ID4gPiA+IHRv
IHRoZQo+ID4gPiA+ID4gY29kZSBmb3IgdGhlIHNha2Ugb2YgcmV1c2luZyBkZXZpY2UgdHJlZSBi
aW5kaW5nLCB0aGlzIHJhaXNlcyBhIHF1ZXN0aW9uCj4gPiA+ID4gPiB3aGV0aGVyIHRoYXTigJlz
IHdvcnRod2hpbGUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9yIEkgcmVhbGx5IG1pc3NlZCBzb21l
dGhpbmc/Cj4gPiA+ID4gSSB0aGluayBBcm5kIHdhcyBwcmltYXJpbHkgc3VnZ2VzdGluZyB0byBy
ZXVzZSB0aGUgSU9NTVUgRGV2aWNlIFRyZWUKPiA+ID4gPiBiaW5kaW5ncywgbm90IG5lY2Vzc2Fy
aWx5IHRoZSBJT01NVSBkcml2ZXJzIGZyYW1ld29yayBpbiBMaW51eCAoYWx0aG91Z2gKPiA+ID4g
PiB0aGF0IHdvdWxkIGJlIGFuIGFkZGVkIGJvbnVzLikKPiA+ID4gPiAKPiA+ID4gPiBJIGtub3cg
ZnJvbSBwcmV2aW91cyBkaXNjdXNzaW9ucyB3aXRoIHlvdSB0aGF0IG1ha2luZyB0aGUgZ3JhbnQg
dGFibGUKPiA+ID4gPiBmaXQgaW4gdGhlIGV4aXN0aW5nIElPTU1VIGRyaXZlcnMgbW9kZWwgaXMg
ZGlmZmljdWx0LCBidXQganVzdCByZXVzaW5nCj4gPiA+ID4gdGhlIERldmljZSBUcmVlIGJpbmRp
bmdzIHNlZW1zIGZlYXNpYmxlPwo+ID4gPiAKPiA+ID4gSSBzdGFydGVkIGV4cGVyaW1lbnRpbmcg
d2l0aCB0aGF0LiBBcyB3cm90ZSBpbiBhIHNlcGFyYXRlIGVtYWlsLCBJIGdvdCBhCj4gPiA+IGRl
ZmVycmVkIHByb2JlIHRpbWVvdXQsCj4gPiA+IAo+ID4gPiBhZnRlciBpbnNlcnRpbmcgcmVxdWly
ZWQgbm9kZXMgaW50byBndWVzdCBkZXZpY2UgdHJlZSwgd2hpY2ggc2VlbXMgdG8gYmUgYQo+ID4g
PiBjb25zZXF1ZW5jZSBvZiB0aGUgdW5hdmFpbGFiaWxpdHkgb2YgSU9NTVUsIEkgd2lsbCBjb250
aW51ZSB0byBpbnZlc3RpZ2F0ZQo+ID4gPiB0aGlzIHF1ZXN0aW9uLgo+ID4gCj4gPiAKPiA+IEkg
aGF2ZSBleHBlcmltZW50ZWQgd2l0aCB0aGF0LiBZZXMsIGp1c3QgcmV1c2luZyB0aGUgRGV2aWNl
IFRyZWUgYmluZGluZ3MgaXMKPiA+IHRlY2huaWNhbGx5IGZlYXNpYmxlIChhbmQgd2UgYXJlIGFi
bGUgdG8gZG8gdGhpcyBieSBvbmx5IHRvdWNoaW5nCj4gPiBncmFudC1kbWEtb3BzLmMpLCBhbHRo
b3VnaCBkZWZlcnJlZCBwcm9iZSB0aW1lb3V0IHN0aWxsIHN0YW5kcyAoYXMgdGhlcmUgaXMgbm8K
PiA+IElPTU1VIGRyaXZlciBiZWluZyBwcmVzZW50IGFjdHVhbGx5KS4KPiA+IAo+ID4gW8KgwqDC
oCAwLjU4Mzc3MV0gdmlydGlvLW1taW8gMjAwMDAwMC52aXJ0aW86IGRlZmVycmVkIHByb2JlIHRp
bWVvdXQsIGlnbm9yaW5nCj4gPiBkZXBlbmRlbmN5Cj4gPiBbwqDCoMKgIDAuNjE1NTU2XSB2aXJ0
aW9fYmxrIHZpcnRpbzA6IFt2ZGFdIDQwOTYwMDAgNTEyLWJ5dGUgbG9naWNhbCBibG9ja3MgKDIu
MTAKPiA+IEdCLzEuOTUgR2lCKQo+ID4gCj4gPiAKPiA+IEJlbG93IHRoZSB3b3JraW5nIGRpZmYg
KG9uIHRvcCBvZiBjdXJyZW50IHNlcmllcyk6Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9ncmFudC1kbWEtb3BzLmMgYi9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMKPiA+IGlu
ZGV4IGRhOWM3ZmYuLjY1ODYxNTIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3hlbi9ncmFudC1k
bWEtb3BzLmMKPiA+ICsrKyBiL2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYwo+ID4gQEAgLTI3
MiwxNyArMjcyLDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX21hcF9vcHMgeGVuX2dyYW50
X2RtYV9vcHMgPSB7Cj4gPiAKPiA+IMKgYm9vbCB4ZW5faXNfZ3JhbnRfZG1hX2RldmljZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gPiDCoHsKPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IGRldmljZV9u
b2RlICppb21tdV9ucDsKPiA+ICvCoMKgwqDCoMKgwqAgYm9vbCBoYXNfaW9tbXU7Cj4gPiArCj4g
PiDCoMKgwqDCoMKgwqDCoCAvKiBYWFggSGFuZGxlIG9ubHkgRFQgZGV2aWNlcyBmb3Igbm93ICov
Cj4gPiDCoMKgwqDCoMKgwqDCoCBpZiAoIWRldi0+b2Zfbm9kZSkKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4gPiAKPiA+IC3CoMKgwqDCoMKgwqAgcmV0
dXJuIG9mX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYtPm9mX25vZGUsICJ4ZW4sYmFja2VuZC1kb21p
ZCIpOwo+ID4gK8KgwqDCoMKgwqDCoCBpb21tdV9ucCA9IG9mX3BhcnNlX3BoYW5kbGUoZGV2LT5v
Zl9ub2RlLCAiaW9tbXVzIiwgMCk7Cj4gPiArwqDCoMKgwqDCoMKgIGhhc19pb21tdSA9IGlvbW11
X25wICYmIG9mX2RldmljZV9pc19jb21wYXRpYmxlKGlvbW11X25wLAo+ID4gInhlbixncmFudC1k
bWEiKTsKPiA+ICvCoMKgwqDCoMKgwqAgb2Zfbm9kZV9wdXQoaW9tbXVfbnApOwo+ID4gKwo+ID4g
K8KgwqDCoMKgwqDCoCByZXR1cm4gaGFzX2lvbW11Owo+ID4gwqB9Cj4gPiAKPiA+IMKgdm9pZCB4
ZW5fZ3JhbnRfc2V0dXBfZG1hX29wcyhzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiDCoHsKPiA+IMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCB4ZW5fZ3JhbnRfZG1hX2RhdGEgKmRhdGE7Cj4gPiAtwqDCoMKg
wqDCoMKgIHVpbnQzMl90IGRvbWlkOwo+ID4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3Qgb2ZfcGhhbmRs
ZV9hcmdzIGlvbW11X3NwZWM7Cj4gPiAKPiA+IMKgwqDCoMKgwqDCoMKgIGRhdGEgPSBmaW5kX3hl
bl9ncmFudF9kbWFfZGF0YShkZXYpOwo+ID4gwqDCoMKgwqDCoMKgwqAgaWYgKGRhdGEpIHsKPiA+
IEBAIC0yOTQsMTYgKzMwMSwzMCBAQCB2b2lkIHhlbl9ncmFudF9zZXR1cF9kbWFfb3BzKHN0cnVj
dCBkZXZpY2UgKmRldikKPiA+IMKgwqDCoMKgwqDCoMKgIGlmICghZGV2LT5vZl9ub2RlKQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+ID4gCj4gPiAtwqDCoMKg
wqDCoMKgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25vZGUsICJ4ZW4sYmFja2Vu
ZC1kb21pZCIsICZkb21pZCkpIHsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
dl9lcnIoZGV2LCAieGVuLGJhY2tlbmQtZG9taWQgcHJvcGVydHkgaXMgbm90IHByZXNlbnRcbiIp
Owo+ID4gK8KgwqDCoMKgwqDCoCBpZiAob2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoZGV2LT5v
Zl9ub2RlLCAiaW9tbXVzIiwgIiNpb21tdS1jZWxscyIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwgJmlvbW11X3NwZWMpKSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkNhbm5vdCBwYXJzZSBpb21tdXMg
cHJvcGVydHlcbiIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7
Cj4gPiArwqDCoMKgwqDCoMKgIH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgaWYgKCFvZl9kZXZp
Y2VfaXNfY29tcGF0aWJsZShpb21tdV9zcGVjLm5wLCAieGVuLGdyYW50LWRtYSIpIHx8Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW9tbXVfc3BlYy5h
cmdzX2NvdW50ICE9IDEpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9l
cnIoZGV2LCAiSW5jb21wYXRpYmxlIElPTU1VIG5vZGVcbiIpOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgb2Zfbm9kZV9wdXQoaW9tbXVfc3BlYy5ucCk7Cj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7Cj4gPiDCoMKgwqDCoMKgwqDCoCB9Cj4gPiAK
PiA+ICvCoMKgwqDCoMKgwqAgb2Zfbm9kZV9wdXQoaW9tbXVfc3BlYy5ucCk7Cj4gPiArCj4gPiDC
oMKgwqDCoMKgwqDCoCBkYXRhID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkYXRhKSwgR0ZQ
X0tFUk5FTCk7Cj4gPiDCoMKgwqDCoMKgwqDCoCBpZiAoIWRhdGEpCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7Cj4gPiAKPiA+IC3CoMKgwqDCoMKgwqAgZGF0YS0+
YmFja2VuZF9kb21pZCA9IGRvbWlkOwo+ID4gK8KgwqDCoMKgwqDCoCAvKgo+ID4gK8KgwqDCoMKg
wqDCoMKgICogVGhlIGVuZHBvaW50IElEIGhlcmUgbWVhbnMgdGhlIElEIG9mIHRoZSBkb21haW4g
d2hlcmUgdGhlCj4gPiBjb3JyZXNwb25kaW5nCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBiYWNrZW5k
IGlzIHJ1bm5pbmcKPiA+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ID4gK8KgwqDCoMKgwqDCoCBkYXRh
LT5iYWNrZW5kX2RvbWlkID0gaW9tbXVfc3BlYy5hcmdzWzBdOwo+ID4gCj4gPiDCoMKgwqDCoMKg
wqDCoCBpZiAoeGFfZXJyKHhhX3N0b3JlKCZ4ZW5fZ3JhbnRfZG1hX2RldmljZXMsICh1bnNpZ25l
ZCBsb25nKWRldiwgZGF0YSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCkpKSB7Cj4gPiAoRU5EKQo+ID4gCj4gPiAKPiA+IAo+ID4g
QmVsb3csIHRoZSBub2RlcyBnZW5lcmF0ZWQgYnkgWGVuIHRvb2xzdGFjazoKPiA+IAo+ID4gwqDC
oMKgwqDCoMKgwqAgeGVuX2dyYW50X2RtYSB7CgpOaXQ6IGlvbW11IHsKCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJ4ZW4sZ3JhbnQtZG1hIjsKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjaW9tbXUtY2VsbHMgPSA8MHgwMT47Cj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGhhbmRsZSA9IDwweGZkZTk+Owo+ID4gwqDC
oMKgwqDCoMKgwqAgfTsKPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqAgdmlydGlvQDIwMDAwMDAgewo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAidmlydGlvLG1t
aW8iOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAwIDB4MjAw
MDAwMCAweDAwIDB4MjAwPjsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRl
cnJ1cHRzID0gPDB4MDAgMHgwMSAweGYwMT47Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaW50ZXJydXB0LXBhcmVudCA9IDwweGZkZTg+Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRtYS1jb2hlcmVudDsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpb21tdXMgPSA8MHhmZGU5IDB4MDE+Owo+ID4gwqDCoMKgwqDCoMKgwqAgfTsKPiAgCj4g
Tm90IGJhZCEgSSBsaWtlIGl0Lgo+ICAKPiAgCj4gPiBJIGFtIHdvbmRlcmluZywgd291bGQgYmUg
dGhlIHByb3BlciBzb2x1dGlvbiB0byBlbGltaW5hdGUgZGVmZXJyZWQgcHJvYmUKPiA+IHRpbWVv
dXQgaXNzdWUgaW4gb3VyIHBhcnRpY3VsYXIgY2FzZSAod2l0aG91dCBpbnRyb2R1Y2luZyBhbiBl
eHRyYSBJT01NVQo+ID4gZHJpdmVyKT8KPiAKPiBJbiByZWFsaXR5IEkgZG9uJ3QgdGhpbmsgdGhl
cmUgaXMgYSB3YXkgdG8gZG8gdGhhdC4gSSB3b3VsZCBjcmVhdGUgYW4KPiBlbXB0eSBza2VsZXRo
b24gSU9NTVUgZHJpdmVyIGZvciB4ZW4sZ3JhbnQtZG1hLgoKRG9lcyBpdCBoYXZlIHRvIGJlIGFu
IGVtcHR5IGRyaXZlcj8gT3JpZ2luYWxseSwgSU9NTVUgJ2RyaXZlcnMnIHdlcmUgbm90IApkcml2
ZXJzLCBidXQgdGhleSd2ZSBiZWVuIGdldHRpbmcgY29udmVydGVkLiBDYW4gdGhhdCBiZSBkb25l
IGhlcmU/CgpTaG9ydCBvZiB0aGF0LCBJIHRoaW5rIHdlIGNvdWxkIGhhdmUgc29tZSBzb3J0IG9m
IHNraXAgcHJvYmUgbGlzdCBmb3IgCmRlZmVycmVkIHByb2JlLiBOb3Qgc3VyZSBpZiB0aGF0IHdv
dWxkIGJlIGVhc2llc3QgYXMgSU9NTVUgc3BlY2lmaWMgb3IgCmdsb2JhbC4KClJvYgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
