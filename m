Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D119C46F
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:38:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 17D7D88A5B;
	Thu,  2 Apr 2020 14:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDQNG-lewxN1; Thu,  2 Apr 2020 14:38:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 739DD88A59;
	Thu,  2 Apr 2020 14:38:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FF14C07FF;
	Thu,  2 Apr 2020 14:38:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F69CC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2939A857E2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXQQIh2gRChk
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:38:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6389D84492
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585838334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zJId47dIDTUhCxWFjRzhT8S4/K1qhmpRh3SERFybFs=;
 b=jIMEsJmSJmkinZEMhfDUuQ6MlMq6ENZAo11dQCCRsj3cbTJAAauccPqKxRWWMBXzMT+NAi
 4J/1Sr8xlZkFWf2eQqO7ELyZsklxKwXcwKPh97LpcD8N6Bv6yLMy7AZh5eMV1cLHVB/CY1
 vIinGVNBnJNzC+tu0v6dfobAGjbVk2E=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-5JOAsSyvMxiPHdB1rBtjvg-1; Thu, 02 Apr 2020 10:38:50 -0400
X-MC-Unique: 5JOAsSyvMxiPHdB1rBtjvg-1
Received: by mail-qt1-f200.google.com with SMTP id x10so3312549qts.14
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 07:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5zJId47dIDTUhCxWFjRzhT8S4/K1qhmpRh3SERFybFs=;
 b=sX3PJxd8iLeGncRsuDAdf3XJwBq1MtoJZEXIJ4kjNS0lNUx6HR4cHwgNoi+Q3Z27Cf
 td4IJ3Ucje5nsR4I1DBgxXO7ozzCtW/gLJgJKP2nrSuG2HsqZJrkfGY1nJ4qrZkpY86x
 iqqQfjnZp1BIaGWJPUTk6TAyqMREsxG/BNbh1gK0GFTqTmIa48wbbnfuUbJejfoW7eTa
 kehClvthvr3u6AXzfXzZe8vXVw3/29nrjDI5gKfNDOv1NUjUMLjCTHu2dUnN3nbrMv53
 tH0fOg46Glk4qUE1Jr5T4MwTnfmBz3J5rIatk85tQs/j1PFTJqHs0RsdCzYhnweLv57r
 j7gg==
X-Gm-Message-State: AGi0PubNl3MFiXQ0kcpV310A+VZRBWUUOm9F1aprHC+eHgZ9X+LFIBl0
 GgRb8qKZWRRJVwa6MgqUhnn+gR6+J8xazOSWy9wQjeCaNp64bphDtvi2BlIYb+Oq5oxL3bULIbU
 nGT33z+ooYJaP41EggZwaN8f4KfxNzstStlPn0+BBog==
X-Received: by 2002:ac8:24c1:: with SMTP id t1mr3248363qtt.275.1585838329507; 
 Thu, 02 Apr 2020 07:38:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypLhy6AetkOXTZr7DRk6EDkALT/IdoKI3LjJeVYjOumPny6hIpCUhk1U1rDap04t/JdFxAlwBg==
X-Received: by 2002:ac8:24c1:: with SMTP id t1mr3248313qtt.275.1585838329193; 
 Thu, 02 Apr 2020 07:38:49 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id q1sm3489017qtn.69.2020.04.02.07.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 07:38:48 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:38:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
Message-ID: <20200402103813-mutt-send-email-mst@kernel.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <20200401092004-mutt-send-email-mst@kernel.org>
 <6b4d169a-9962-6014-5423-1507059343e9@redhat.com>
 <20200401100954-mutt-send-email-mst@kernel.org>
 <3dd3b7e7-e3d9-dba4-00fc-868081f95ab7@redhat.com>
 <20200401120643-mutt-send-email-mst@kernel.org>
 <c11c2195-88eb-2096-af47-40f2da5b389f@redhat.com>
 <20200402100257-mutt-send-email-mst@kernel.org>
 <279ed96c-5331-9da6-f9c1-b49e87d49c31@redhat.com>
MIME-Version: 1.0
In-Reply-To: <279ed96c-5331-9da6-f9c1-b49e87d49c31@redhat.com>
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

T24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMTA6MjM6NTlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMiDkuIvljYgxMDowMywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMTE6MjI6NTdBTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAyMC80LzIg5LiK5Y2IMTI6MDgsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIEFwciAwMSwgMjAyMCBhdCAxMDoyOTozMlBNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gPkZyb20gOWIzYTVkMjNiOGJmNmIwYTExZTY1
ZTY4ODMzNWQ3ODJmOGU2YWE1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+ID4gPiA+IEZy
b206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiBEYXRlOiBXZWQs
IDEgQXByIDIwMjAgMjI6MTc6MjcgKzA4MDAKPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSF0gdmhv
c3Q6IGxldCBDT05GSUdfVkhPU1QgdG8gYmUgc2VsZWN0ZWQgYnkgZHJpdmVycwo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBUaGUgZGVmY29uZmlnIG9uIHNvbWUgYXJjaHMgZW5hYmxlIHZob3N0X25ldCBv
ciB2aG9zdF92c29jayBieQo+ID4gPiA+ID4gZGVmYXVsdC4gU28gaW5zdGVhZCBvZiBhZGRpbmcg
Q09ORklHX1ZIT1NUPW0gdG8gYWxsIG9mIHRob3NlIGZpbGVzLAo+ID4gPiA+ID4gc2ltcGx5IGxl
dHRpbmcgQ09ORklHX1ZIT1NUIHRvIGJlIHNlbGVjdGVkIGJ5IGFsbCBvZiB0aGUgdmhvc3QKPiA+
ID4gPiA+IGRyaXZlcnMuIFRoaXMgZml4ZXMgdGhlIGJ1aWxkIG9uIHRoZSBhcmNocyB3aXRoIENP
TkZJR19WSE9TVF9ORVQ9bSBpbgo+ID4gPiA+ID4gdGhlaXIgZGVmY29uZmlnLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29t
Pgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgICBkcml2ZXJzL3Zob3N0L0tjb25maWcgfCAxNSAr
KysrKysrKysrKy0tLS0KPiA+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aG9zdC9LY29uZmlnIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gPiA+ID4gPiBpbmRl
eCAyNTIzYTFkNDI5MGEuLjM2MmI4MzJmNTMzOCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvdmhvc3QvS2NvbmZpZwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4g
PiA+ID4gPiBAQCAtMTEsMTkgKzExLDIzIEBAIGNvbmZpZyBWSE9TVF9SSU5HCj4gPiA+ID4gPiAg
ICAJICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRv
IGFjY2Vzcwo+ID4gPiA+ID4gICAgCSAgdGhlIGhvc3Qgc2lkZSBvZiBhIHZpcnRpbyByaW5nLgo+
ID4gPiA+ID4gLW1lbnVjb25maWcgVkhPU1QKPiA+ID4gPiA+IC0JdHJpc3RhdGUgIkhvc3Qga2Vy
bmVsIGFjY2VsZXJhdG9yIGZvciB2aXJ0aW8gKFZIT1NUKSIKPiA+ID4gPiA+IC0JZGVwZW5kcyBv
biBFVkVOVEZECj4gPiA+ID4gPiArY29uZmlnIFZIT1NUCj4gPiA+ID4gPiArCXRyaXN0YXRlCj4g
PiA+ID4gPiAgICAJc2VsZWN0IFZIT1NUX0lPVExCCj4gPiA+ID4gPiAgICAJaGVscAo+ID4gPiA+
ID4gICAgCSAgVGhpcyBvcHRpb24gaXMgc2VsZWN0ZWQgYnkgYW55IGRyaXZlciB3aGljaCBuZWVk
cyB0byBhY2Nlc3MKPiA+ID4gPiA+ICAgIAkgIHRoZSBjb3JlIG9mIHZob3N0Lgo+ID4gPiA+ID4g
LWlmIFZIT1NUCj4gPiA+ID4gPiArbWVudWNvbmZpZyBWSE9TVF9NRU5VCj4gPiA+ID4gPiArCWJv
b2wgIlZIT1NUIGRyaXZlcnMiCj4gPiA+ID4gPiArCWRlZmF1bHQgeQo+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gK2lmIFZIT1NUX01FTlUKPiA+ID4gPiA+ICAgIGNvbmZpZyBWSE9TVF9ORVQKPiA+ID4g
PiA+ICAgIAl0cmlzdGF0ZSAiSG9zdCBrZXJuZWwgYWNjZWxlcmF0b3IgZm9yIHZpcnRpbyBuZXQi
Cj4gPiA+ID4gPiAgICAJZGVwZW5kcyBvbiBORVQgJiYgRVZFTlRGRCAmJiAoVFVOIHx8ICFUVU4p
ICYmIChUQVAgfHwgIVRBUCkKPiA+ID4gPiA+ICsJc2VsZWN0IFZIT1NUCj4gPiA+ID4gPiAgICAJ
LS0taGVscC0tLQo+ID4gPiA+ID4gICAgCSAgVGhpcyBrZXJuZWwgbW9kdWxlIGNhbiBiZSBsb2Fk
ZWQgaW4gaG9zdCBrZXJuZWwgdG8gYWNjZWxlcmF0ZQo+ID4gPiA+ID4gICAgCSAgZ3Vlc3QgbmV0
d29ya2luZyB3aXRoIHZpcnRpb19uZXQuIE5vdCB0byBiZSBjb25mdXNlZCB3aXRoIHZpcnRpb19u
ZXQKPiA+ID4gPiA+IEBAIC0zNSw2ICszOSw3IEBAIGNvbmZpZyBWSE9TVF9ORVQKPiA+ID4gPiA+
ICAgIGNvbmZpZyBWSE9TVF9TQ1NJCj4gPiA+ID4gPiAgICAJdHJpc3RhdGUgIlZIT1NUX1NDU0kg
VENNIGZhYnJpYyBkcml2ZXIiCj4gPiA+ID4gPiAgICAJZGVwZW5kcyBvbiBUQVJHRVRfQ09SRSAm
JiBFVkVOVEZECj4gPiA+ID4gPiArCXNlbGVjdCBWSE9TVAo+ID4gPiA+ID4gICAgCWRlZmF1bHQg
bgo+ID4gPiA+ID4gICAgCS0tLWhlbHAtLS0KPiA+ID4gPiA+ICAgIAlTYXkgTSBoZXJlIHRvIGVu
YWJsZSB0aGUgdmhvc3Rfc2NzaSBUQ00gZmFicmljIG1vZHVsZQo+ID4gPiA+ID4gQEAgLTQzLDYg
KzQ4LDcgQEAgY29uZmlnIFZIT1NUX1NDU0kKPiA+ID4gPiA+ICAgIGNvbmZpZyBWSE9TVF9WU09D
Swo+ID4gPiA+ID4gICAgCXRyaXN0YXRlICJ2aG9zdCB2aXJ0aW8tdnNvY2sgZHJpdmVyIgo+ID4g
PiA+ID4gICAgCWRlcGVuZHMgb24gVlNPQ0tFVFMgJiYgRVZFTlRGRAo+ID4gPiA+ID4gKwlzZWxl
Y3QgVkhPU1QKPiA+ID4gPiA+ICAgIAlzZWxlY3QgVklSVElPX1ZTT0NLRVRTX0NPTU1PTgo+ID4g
PiA+ID4gICAgCWRlZmF1bHQgbgo+ID4gPiA+ID4gICAgCS0tLWhlbHAtLS0KPiA+ID4gPiA+IEBA
IC01Niw2ICs2Miw3IEBAIGNvbmZpZyBWSE9TVF9WU09DSwo+ID4gPiA+ID4gICAgY29uZmlnIFZI
T1NUX1ZEUEEKPiA+ID4gPiA+ICAgIAl0cmlzdGF0ZSAiVmhvc3QgZHJpdmVyIGZvciB2RFBBLWJh
c2VkIGJhY2tlbmQiCj4gPiA+ID4gPiAgICAJZGVwZW5kcyBvbiBFVkVOVEZECj4gPiA+ID4gPiAr
CXNlbGVjdCBWSE9TVAo+ID4gPiAKPiA+ID4gVGhpcyBwYXJ0IGlzIG5vdCBzcXVhc2hlZC4KPiA+
ID4gCj4gPiA+IAo+ID4gPiA+ID4gICAgCXNlbGVjdCBWRFBBCj4gPiA+ID4gPiAgICAJaGVscAo+
ID4gPiA+ID4gICAgCSAgVGhpcyBrZXJuZWwgbW9kdWxlIGNhbiBiZSBsb2FkZWQgaW4gaG9zdCBr
ZXJuZWwgdG8gYWNjZWxlcmF0ZQo+ID4gPiA+IE9LIHNvIEkgc3F1YXNoZWQgdGhpcyBpbnRvIHRo
ZSBvcmlnaW5hbCBidWdneSBwYXRjaC4KPiA+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIHBsYXkgd2l0
aCB2aG9zdCBicmFuY2ggb2YgbXkgdHJlZSBvbiB2YXJpb3VzCj4gPiA+ID4gYXJjaGVzPyBJZiBp
dCBsb29rcyBvayB0byB5b3UgbGV0IG1lIGtub3cgSSdsbCBwdXNoCj4gPiA+ID4gdGhpcyB0byBu
ZXh0Lgo+ID4gPiAKPiA+ID4gV2l0aCB0aGUgYWJvdmUgcGFydCBzcXVhc2hlZC4gSSd2ZSB0ZXN0
ZWQgYWxsIHRoZSBhcmNocyB3aG9zZSBkZWZjb25maWcgaGF2ZQo+ID4gPiBWSE9TVF9ORVQgb3Ig
VkhPU1RfVlNPQ0sgZW5hYmxlZC4KPiA+ID4gCj4gPiA+IEFsbCBsb29rcyBmaW5lLgo+ID4gPiAK
PiA+ID4gVGhhbmtzCj4gPiAKPiA+IEknbSBhIGJpdCBjb25mdXNlZC4gU28gaXMgdGhlIG5leHQg
dGFnIGluIG15IHRyZWUgb2sgbm93Pwo+IAo+IAo+IFN0aWxsIG5lZWQgdG8gc2VsZWN0IENPTkZJ
R19WSE9TVCBmb3LCoCBDT05GSUdfVkhPU1RfVkRQQS4gT3RoZXJzIGFyZSBvay4KPiAKPiBUaGFu
a3MKCgpPaCBsaWtlIHRoaXMgdGhlbj8KCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tjb25m
aWcgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKaW5kZXggYmRkMjcwZmVkZTI2Li5jYjZiMTczMjNl
YjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZworKysgYi9kcml2ZXJzL3Zob3N0
L0tjb25maWcKQEAgLTYxLDYgKzYzLDcgQEAgY29uZmlnIFZIT1NUX1ZTT0NLCiBjb25maWcgVkhP
U1RfVkRQQQogCXRyaXN0YXRlICJWaG9zdCBkcml2ZXIgZm9yIHZEUEEtYmFzZWQgYmFja2VuZCIK
IAlkZXBlbmRzIG9uIEVWRU5URkQKKwlzZWxlY3QgVkhPU1QKIAlzZWxlY3QgVkRQQQogCWhlbHAK
IAkgIFRoaXMga2VybmVsIG1vZHVsZSBjYW4gYmUgbG9hZGVkIGluIGhvc3Qga2VybmVsIHRvIGFj
Y2VsZXJhdGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
