Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A54819ADA3
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:18:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6472F20451;
	Wed,  1 Apr 2020 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5J4JAHMwVtAC; Wed,  1 Apr 2020 14:18:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5E7CF2041E;
	Wed,  1 Apr 2020 14:18:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AB5FC1D8D;
	Wed,  1 Apr 2020 14:18:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9113DC089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7AEA686D48
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TijuY_CCPxLb
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:18:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 083B186D24
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585750691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koigHvjQZC19eKDd8fYYKD1byFLtuNk9rFfv+MSme6o=;
 b=Qt3Iy2y0FUVVrw1OuBt/ndUioHleMKP01GPQmVuUXclFzfiO+Y0IyxYufyQqOfHgPSKek3
 yX1Xa0UwZdUMaX3+q+c5Axdd8bezyqS4uhVivs0KevoVUAkP8k+V9xM9KyFwukDLr/NPNo
 UoRS4uojGQYIDKKaCCtvNeWCWiYEeFU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-BaJ90KCvOVCDO0Om8QEYVQ-1; Wed, 01 Apr 2020 10:18:10 -0400
X-MC-Unique: BaJ90KCvOVCDO0Om8QEYVQ-1
Received: by mail-wr1-f72.google.com with SMTP id u16so11661452wrp.14
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 07:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=koigHvjQZC19eKDd8fYYKD1byFLtuNk9rFfv+MSme6o=;
 b=nCPa5nHAQdt/x+lsUsHiYpa4hQWhngDtB9iruk3UeGlwcV5D/kmNjam403fWgNHgxk
 LZM/1H+byf1P3W1paw7hR+7QlgR/Fz4ONtsyhhHOk7hV7wzFhCqZAnM9PB6iPQzFeO1B
 CrEMnA98oZ3KBRYiNBVQuNGHZcVAhgZIpfkL5wn7NIqmhspLn5rEhJtbW0sm0ICpcEW8
 Yp6BWIyaYN6EQWMv82yFHak1jUh0TcreK2xyCpsSSNTu4o0ZilRbxUq1XMzg6Ku6FNRf
 VGjhqGYga1AYeY85YMg2LaeNFFGgBrdoFBaxlNYDLOKFRuMV0RFvrt0yxpGNRuVe4ZUR
 e+Ag==
X-Gm-Message-State: AGi0PubeNeEYQbM7+tTPZdafFcJ3ke3bTy5eiQmecHwYu1zN+mvsqqAD
 8Tom88YN+ZBG4fG6ppBDL+jizI2daRHkdYFGJPu4j4stXSjWIW/JW3ynjId1Hn2GffST55rTKtG
 9nb7/WFowDQAnpF/FSP6dbkCvNxNNzVtA8WJgrARm5w==
X-Received: by 2002:a05:600c:2949:: with SMTP id
 n9mr4854296wmd.129.1585750687900; 
 Wed, 01 Apr 2020 07:18:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypIDbSLF7skcDOxwD6+QUFmg2lPeWzSgOX1pVJzAYBHdhN6pMa1uaSvkuWaE5DTOSSwxR6SXXw==
X-Received: by 2002:a05:600c:2949:: with SMTP id
 n9mr4854274wmd.129.1585750687676; 
 Wed, 01 Apr 2020 07:18:07 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id r5sm2901223wmr.15.2020.04.01.07.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 07:18:07 -0700 (PDT)
Date: Wed, 1 Apr 2020 10:18:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
Message-ID: <20200401101634-mutt-send-email-mst@kernel.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
 <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
 <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
 <c423c5b1-7817-7417-d7af-e07bef6368e7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c423c5b1-7817-7417-d7af-e07bef6368e7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, hanand@xilinx.com,
 hch@infradead.org, eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
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

T24gV2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6MTM6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMSDkuIvljYg5OjAyLCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3Jv
dGU6Cj4gPiAKPiA+IE9uIDAxLjA0LjIwIDE0OjU2LCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3Jv
dGU6Cj4gPiA+IE9uIDAxLjA0LjIwIDE0OjUwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+IE9u
IDIwMjAvNC8xIOS4i+WNiDc6MjEsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPiA+ID4g
PiA+IE9uIDI2LjAzLjIwIDE1OjAxLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gPiBDdXJy
ZW50bHksIENPTkZJR19WSE9TVCBkZXBlbmRzIG9uIENPTkZJR19WSVJUVUFMSVpBVElPTi4gQnV0
IHZob3N0IGlzCj4gPiA+ID4gPiA+IG5vdCBuZWNlc3NhcmlseSBmb3IgVk0gc2luY2UgaXQncyBh
IGdlbmVyaWMgdXNlcnNwYWNlIGFuZCBrZXJuZWwKPiA+ID4gPiA+ID4gY29tbXVuaWNhdGlvbiBw
cm90b2NvbC4gU3VjaCBkZXBlbmRlbmN5IG1heSBwcmV2ZW50IGFyY2hzIHdpdGhvdXQKPiA+ID4g
PiA+ID4gdmlydHVhbGl6YXRpb24gc3VwcG9ydCBmcm9tIHVzaW5nIHZob3N0Lgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gVG8gc29sdmUgdGhpcywgYSBkZWRpY2F0ZWQgdmhvc3QgbWVudSBpcyBj
cmVhdGVkIHVuZGVyIGRyaXZlcnMgc28KPiA+ID4gPiA+ID4gQ09OSUZHX1ZIT1NUIGNhbiBiZSBk
ZWNvdXBsZWQgb3V0IG9mIENPTkZJR19WSVJUVUFMSVpBVElPTi4KPiA+ID4gPiA+IEZXSVcsIHRo
aXMgbm93IHJlc3VsdHMgaW4gdmhvc3Qgbm90IGJlaW5nIGJ1aWxkIHdpdGggZGVmY29uZmlnIGtl
cm5lbHMgKGluIHRvZGF5cwo+ID4gPiA+ID4gbGludXgtbmV4dCkuCj4gPiA+ID4gPiAKPiA+ID4g
PiBIaSBDaHJpc3RpYW46Cj4gPiA+ID4gCj4gPiA+ID4gRGlkIHlvdSBtZWV0IGl0IGV2ZW4gd2l0
aCB0aGlzIGNvbW1pdMKgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPWE0YmU0MGNiY2VkYmE5YjViNzE0
ZjNjOTUxODJlOGE0NTE3NmU0MmQ/Cj4gPiA+IEkgc2ltcGx5IHVzZWQgbGludXgtbmV4dC4gVGhl
IGRlZmNvbmZpZyBkb2VzIE5PVCBjb250YWluIENPTkZJR19WSE9TVCBhbmQgdGhlcmVmb3JlIENP
TkZJR19WSE9TVF9ORVQgYW5kIGZyaWVuZHMKPiA+ID4gY2FuIG5vdCBiZSBzZWxlY3RlZC4KPiA+
ID4gCj4gPiA+ICQgZ2l0IGNoZWNrb3V0IG5leHQtMjAyMDA0MDEKPiA+ID4gJCBtYWtlIGRlZmNv
bmZpZwo+ID4gPiAgICBIT1NUQ0MgIHNjcmlwdHMvYmFzaWMvZml4ZGVwCj4gPiA+ICAgIEhPU1RD
QyAgc2NyaXB0cy9rY29uZmlnL2NvbmYubwo+ID4gPiAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZp
Zy9jb25mZGF0YS5vCj4gPiA+ICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL2V4cHIubwo+ID4g
PiAgICBMRVggICAgIHNjcmlwdHMva2NvbmZpZy9sZXhlci5sZXguYwo+ID4gPiAgICBZQUNDICAg
IHNjcmlwdHMva2NvbmZpZy9wYXJzZXIudGFiLltjaF0KPiA+ID4gICAgSE9TVENDICBzY3JpcHRz
L2tjb25maWcvbGV4ZXIubGV4Lm8KPiA+ID4gICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvcGFy
c2VyLnRhYi5vCj4gPiA+ICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL3ByZXByb2Nlc3Mubwo+
ID4gPiAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9zeW1ib2wubwo+ID4gPiAgICBIT1NUQ0Mg
IHNjcmlwdHMva2NvbmZpZy91dGlsLm8KPiA+ID4gICAgSE9TVExEICBzY3JpcHRzL2tjb25maWcv
Y29uZgo+ID4gPiAqKiogRGVmYXVsdCBjb25maWd1cmF0aW9uIGlzIGJhc2VkIG9uICd4ODZfNjRf
ZGVmY29uZmlnJwo+ID4gPiAjCj4gPiA+ICMgY29uZmlndXJhdGlvbiB3cml0dGVuIHRvIC5jb25m
aWcKPiA+ID4gIwo+ID4gPiAKPiA+ID4gJCBncmVwIFZIT1NUIC5jb25maWcKPiA+ID4gIyBDT05G
SUdfVkhPU1QgaXMgbm90IHNldAo+ID4gPiAKPiA+ID4gPiBJZiB5ZXMsIHdoYXQncyB5b3VyIGJ1
aWxkIGNvbmZpZyBsb29rcyBsaWtlPwo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcwo+ID4gVGhpcyB3
YXMgeDg2LiBOb3Qgc3VyZSBpZiB0aGF0IGRpZCB3b3JrIGJlZm9yZS4KPiA+IE9uIHMzOTAgdGhp
cyBpcyBkZWZpbml0ZWx5IGEgcmVncmVzc2lvbiBhcyB0aGUgZGVmY29uZmlnIGZpbGVzCj4gPiBm
b3IgczM5MCBkbyBzZWxlY3QgVkhPU1RfTkVUCj4gPiAKPiA+IGdyZXAgVkhPU1QgYXJjaC9zMzkw
L2NvbmZpZ3MvKgo+ID4gYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnOkNPTkZJR19W
SE9TVF9ORVQ9bQo+ID4gYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnOkNPTkZJR19W
SE9TVF9WU09DSz1tCj4gPiBhcmNoL3MzOTAvY29uZmlncy9kZWZjb25maWc6Q09ORklHX1ZIT1NU
X05FVD1tCj4gPiBhcmNoL3MzOTAvY29uZmlncy9kZWZjb25maWc6Q09ORklHX1ZIT1NUX1ZTT0NL
PW0KPiA+IAo+ID4gYW5kIHRoaXMgd29ya2VkIHdpdGggNS42LCBidXQgZG9lcyBub3Qgd29yayB3
aXRoIG5leHQuIEp1c3QgYWRkaW5nCj4gPiBDT05GSUdfVkhPU1Q9bSB0byB0aGUgZGVmY29uZmln
IHNvbHZlcyB0aGUgaXNzdWUsIHNvbWV0aGluZyBsaWtlCj4gCj4gCj4gUmlnaHQsIEkgdGhpbmsg
d2UgcHJvYmFibHkgbmVlZAo+IAo+IDEpIGFkZCBDT05GSUdfVkhPU1Q9bSB0byBhbGwgZGVmY29u
ZmlncyB0aGF0IGVuYWJsZXMKPiBDT05GSUdfVkhPU1RfTkVUL1ZTT0NLL1NDU0kuCj4gCj4gb3IK
PiAKPiAyKSBkb24ndCB1c2UgbWVudWNvbmZpZyBmb3IgQ09ORklHX1ZIT1NULCBsZXQgTkVUL1ND
U0kvVkRQQSBqdXN0IHNlbGVjdCBpdC4KPiAKPiBUaGFua3MKCkkgdGhpbmsgSSBwcmVmZXIgMiwg
YnV0IGRvZXMgaXQgYXV0by1zZWxlY3QgVkhPU1RfSU9UTEIgdGhlbj8KR2VuZXJhbGx5IHdoYXQg
d2FzIHRoZSByZWFzb24gdG8gZHJvcCBzZWxlY3QgVkhPU1QgZnJvbSBkZXZpY2VzPwoKCj4gCj4g
PiAKPiA+IC0tLQo+ID4gICBhcmNoL3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWcgfCA1ICsr
Ky0tCj4gPiAgIGFyY2gvczM5MC9jb25maWdzL2RlZmNvbmZpZyAgICAgICB8IDUgKysrLS0KPiA+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWcgYi9hcmNo
L3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWcKPiA+IGluZGV4IDQ2MDM4YmM1OGM5ZS4uMGI4
MzI3NDM0MWNlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29u
ZmlnCj4gPiArKysgYi9hcmNoL3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWcKPiA+IEBAIC01
Nyw4ICs1Nyw2IEBAIENPTkZJR19QUk9URUNURURfVklSVFVBTElaQVRJT05fR1VFU1Q9eQo+ID4g
ICBDT05GSUdfQ01NPW0KPiA+ICAgQ09ORklHX0FQUExEQVRBX0JBU0U9eQo+ID4gICBDT05GSUdf
S1ZNPW0KPiA+IC1DT05GSUdfVkhPU1RfTkVUPW0KPiA+IC1DT05GSUdfVkhPU1RfVlNPQ0s9bQo+
ID4gICBDT05GSUdfT1BST0ZJTEU9bQo+ID4gICBDT05GSUdfS1BST0JFUz15Cj4gPiAgIENPTkZJ
R19KVU1QX0xBQkVMPXkKPiA+IEBAIC01NjEsNiArNTU5LDkgQEAgQ09ORklHX1ZGSU9fTURFVl9E
RVZJQ0U9bQo+ID4gICBDT05GSUdfVklSVElPX1BDST1tCj4gPiAgIENPTkZJR19WSVJUSU9fQkFM
TE9PTj1tCj4gPiAgIENPTkZJR19WSVJUSU9fSU5QVVQ9eQo+ID4gK0NPTkZJR19WSE9TVD1tCj4g
PiArQ09ORklHX1ZIT1NUX05FVD1tCj4gPiArQ09ORklHX1ZIT1NUX1ZTT0NLPW0KPiA+ICAgQ09O
RklHX1MzOTBfQ0NXX0lPTU1VPXkKPiA+ICAgQ09ORklHX1MzOTBfQVBfSU9NTVU9eQo+ID4gICBD
T05GSUdfRVhUNF9GUz15Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29u
ZmlnIGIvYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnCj4gPiBpbmRleCA3Y2QwNjQ4YzFmNGUu
LjM5ZTY5YzRlOGNmNyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvczM5MC9jb25maWdzL2RlZmNvbmZp
Zwo+ID4gKysrIGIvYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnCj4gPiBAQCAtNTcsOCArNTcs
NiBAQCBDT05GSUdfUFJPVEVDVEVEX1ZJUlRVQUxJWkFUSU9OX0dVRVNUPXkKPiA+ICAgQ09ORklH
X0NNTT1tCj4gPiAgIENPTkZJR19BUFBMREFUQV9CQVNFPXkKPiA+ICAgQ09ORklHX0tWTT1tCj4g
PiAtQ09ORklHX1ZIT1NUX05FVD1tCj4gPiAtQ09ORklHX1ZIT1NUX1ZTT0NLPW0KPiA+ICAgQ09O
RklHX09QUk9GSUxFPW0KPiA+ICAgQ09ORklHX0tQUk9CRVM9eQo+ID4gICBDT05GSUdfSlVNUF9M
QUJFTD15Cj4gPiBAQCAtNTU3LDYgKzU1NSw5IEBAIENPTkZJR19WRklPX01ERVZfREVWSUNFPW0K
PiA+ICAgQ09ORklHX1ZJUlRJT19QQ0k9bQo+ID4gICBDT05GSUdfVklSVElPX0JBTExPT049bQo+
ID4gICBDT05GSUdfVklSVElPX0lOUFVUPXkKPiA+ICtDT05GSUdfVkhPU1Q9bQo+ID4gK0NPTkZJ
R19WSE9TVF9ORVQ9bQo+ID4gK0NPTkZJR19WSE9TVF9WU09DSz1tCj4gPiAgIENPTkZJR19TMzkw
X0NDV19JT01NVT15Cj4gPiAgIENPTkZJR19TMzkwX0FQX0lPTU1VPXkKPiA+ICAgQ09ORklHX0VY
VDRfRlM9eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
