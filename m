Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459D19ADCC
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:27:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12380881F9;
	Wed,  1 Apr 2020 14:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJM5PEUR6L73; Wed,  1 Apr 2020 14:27:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 515C7881DC;
	Wed,  1 Apr 2020 14:27:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42410C089F;
	Wed,  1 Apr 2020 14:27:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AF95C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1AAE885FC3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NkUoDtE-vyWu
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:27:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 349E485F37
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585751254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AC+xCtqiJYVKw8uvibXZdquPbYJhxrP3dh8NvWfdbEs=;
 b=Iqv/Hu9ta1nL+IuVNpRxKg2Pap3SV5q848wQQFuMKL3I3zaQIQm9xjvyeDBLCsplthU+K4
 KXx8lnOxf07f6oIgpHN7k7bFinmmrLObwMPX1f+E3VoIAnSOyV8WodXTj4DKDwcrfNyJJf
 MRoZ7Ja+nEB2mYVqavT6A6T2WoQNnPA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-A_uSfBQ9PrO1kDRM4-LhXQ-1; Wed, 01 Apr 2020 10:27:31 -0400
X-MC-Unique: A_uSfBQ9PrO1kDRM4-LhXQ-1
Received: by mail-wr1-f69.google.com with SMTP id h14so14611951wrr.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 07:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AC+xCtqiJYVKw8uvibXZdquPbYJhxrP3dh8NvWfdbEs=;
 b=gfujLNhIsbNHGa/8SCmb8r4aajWREtTPpwPOW1mpx1YM6a5l+RYKwnOKO7GokRIpQg
 vK0E/WR5hcPd9ep6OqzVNHt0gu4asScCQa4KDeuwgwYizYNn1jSJWs3JdCkbxbazOVb1
 EiCVK25yQQYLrF55F1WHVI+rii+iaqxZzfDQQRpXdYcD5PZxVrf/JtWozHVAFyNTm9ox
 ecCynmVThsmhbB9pdLCKrqmZT1aMYRIGo/4aZo9xc9BfEOjZIcaLnels5TevOGciFODo
 aVx9yFrmabU03q53SRhbcc6EtLjjxkTRf73Q2YOdFNoco8jbQONY2Ndftn93Qv450ALz
 8A+w==
X-Gm-Message-State: AGi0PubXgV7rirEZb+NoLq5D/cWuGfCh2i63IHu+7HescZxo9rEeFbvz
 NSaAINS+8GXNyQ5sRsvkTB81vbgQUfhExst1iQ3e+oHbH18JIob4rqrjhzm7JzfMyLF7InyyhFb
 Nsvpkr7QFEn2iBpmR0GuHbjJuLahZtH95TLlEThuUgg==
X-Received: by 2002:a1c:7d83:: with SMTP id y125mr4743874wmc.21.1585751249837; 
 Wed, 01 Apr 2020 07:27:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJJt7lJi60JuKAIp/rXIjmTJwlS5cY9W7TmEAMkhxUGDg3AMcGVYKQShXzSwPvJ9KNLjAunKg==
X-Received: by 2002:a1c:7d83:: with SMTP id y125mr4743844wmc.21.1585751249553; 
 Wed, 01 Apr 2020 07:27:29 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id b127sm635666wmd.2.2020.04.01.07.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 07:27:28 -0700 (PDT)
Date: Wed, 1 Apr 2020 10:27:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
Message-ID: <20200401102631-mutt-send-email-mst@kernel.org>
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
U0kvVkRQQSBqdXN0IHNlbGVjdCBpdC4KPiAKPiBUaGFua3MKCk9LIEkgdHJpZWQgdGhpczoKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tjb25maWcgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcK
aW5kZXggMjUyM2ExZDQyOTBhLi5hMzE0YjkwMGQ0NzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmhv
c3QvS2NvbmZpZworKysgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKQEAgLTE5LDExICsxOSwxMCBA
QCBtZW51Y29uZmlnIFZIT1NUCiAJICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJp
dmVyIHdoaWNoIG5lZWRzIHRvIGFjY2VzcwogCSAgdGhlIGNvcmUgb2Ygdmhvc3QuCiAKLWlmIFZI
T1NUCi0KIGNvbmZpZyBWSE9TVF9ORVQKIAl0cmlzdGF0ZSAiSG9zdCBrZXJuZWwgYWNjZWxlcmF0
b3IgZm9yIHZpcnRpbyBuZXQiCiAJZGVwZW5kcyBvbiBORVQgJiYgRVZFTlRGRCAmJiAoVFVOIHx8
ICFUVU4pICYmIChUQVAgfHwgIVRBUCkKKwlzZWxlY3QgVkhPU1QKIAktLS1oZWxwLS0tCiAJICBU
aGlzIGtlcm5lbCBtb2R1bGUgY2FuIGJlIGxvYWRlZCBpbiBob3N0IGtlcm5lbCB0byBhY2NlbGVy
YXRlCiAJICBndWVzdCBuZXR3b3JraW5nIHdpdGggdmlydGlvX25ldC4gTm90IHRvIGJlIGNvbmZ1
c2VkIHdpdGggdmlydGlvX25ldApAQCAtMzUsNiArMzQsNyBAQCBjb25maWcgVkhPU1RfTkVUCiBj
b25maWcgVkhPU1RfU0NTSQogCXRyaXN0YXRlICJWSE9TVF9TQ1NJIFRDTSBmYWJyaWMgZHJpdmVy
IgogCWRlcGVuZHMgb24gVEFSR0VUX0NPUkUgJiYgRVZFTlRGRAorCXNlbGVjdCBWSE9TVAogCWRl
ZmF1bHQgbgogCS0tLWhlbHAtLS0KIAlTYXkgTSBoZXJlIHRvIGVuYWJsZSB0aGUgdmhvc3Rfc2Nz
aSBUQ00gZmFicmljIG1vZHVsZQpAQCAtNDQsNiArNDQsNyBAQCBjb25maWcgVkhPU1RfVlNPQ0sK
IAl0cmlzdGF0ZSAidmhvc3QgdmlydGlvLXZzb2NrIGRyaXZlciIKIAlkZXBlbmRzIG9uIFZTT0NL
RVRTICYmIEVWRU5URkQKIAlzZWxlY3QgVklSVElPX1ZTT0NLRVRTX0NPTU1PTgorCXNlbGVjdCBW
SE9TVAogCWRlZmF1bHQgbgogCS0tLWhlbHAtLS0KIAlUaGlzIGtlcm5lbCBtb2R1bGUgY2FuIGJl
IGxvYWRlZCBpbiB0aGUgaG9zdCBrZXJuZWwgdG8gcHJvdmlkZSBBRl9WU09DSwpAQCAtNTcsNiAr
NTgsNyBAQCBjb25maWcgVkhPU1RfVkRQQQogCXRyaXN0YXRlICJWaG9zdCBkcml2ZXIgZm9yIHZE
UEEtYmFzZWQgYmFja2VuZCIKIAlkZXBlbmRzIG9uIEVWRU5URkQKIAlzZWxlY3QgVkRQQQorCXNl
bGVjdCBWSE9TVAogCWhlbHAKIAkgIFRoaXMga2VybmVsIG1vZHVsZSBjYW4gYmUgbG9hZGVkIGlu
IGhvc3Qga2VybmVsIHRvIGFjY2VsZXJhdGUKIAkgIGd1ZXN0IHZpcnRpbyBkZXZpY2VzIHdpdGgg
dGhlIHZEUEEtYmFzZWQgYmFja2VuZHMuCkBAIC03OCw1ICs4MCwzIEBAIGNvbmZpZyBWSE9TVF9D
Uk9TU19FTkRJQU5fTEVHQUNZCiAJICBhZGRzIHNvbWUgb3ZlcmhlYWQsIGl0IGlzIGRpc2FibGVk
IGJ5IGRlZmF1bHQuCiAKIAkgIElmIHVuc3VyZSwgc2F5ICJOIi4KLQotZW5kaWYKCgpCdXQgbm93
IENPTkZJR19WSE9TVCBpcyBhbHdheXMgInkiLCBuZXZlciAibSIuCldoaWNoIEkgdGhpbmsgd2ls
bCBtYWtlIGl0IGEgYnVpbHQtaW4uCkRpZG4ndCBmaWd1cmUgb3V0IHdoeSB5ZXQuCgotLSAKTVNU
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
