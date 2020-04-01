Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DD19AC2B
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 14:56:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 759F12039E;
	Wed,  1 Apr 2020 12:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zz9okW935fCf; Wed,  1 Apr 2020 12:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2DC5920407;
	Wed,  1 Apr 2020 12:56:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D161C089F;
	Wed,  1 Apr 2020 12:56:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D516AC089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BEDF287ECD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiONXAIwPI2G
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:56:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 281F887E62
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:56:46 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031CeOeP137804
 for <virtualization@lists.linux-foundation.org>; Wed, 1 Apr 2020 08:56:43 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304h3w9n0f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 08:56:42 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Wed, 1 Apr 2020 13:56:23 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 13:56:14 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031CuTNx53805308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 12:56:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C359A5205F;
 Wed,  1 Apr 2020 12:56:29 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.71.143])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5F0E552050;
 Wed,  1 Apr 2020 12:56:28 +0000 (GMT)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Wed, 1 Apr 2020 14:56:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20040112-0020-0000-0000-000003BF9CC2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040112-0021-0000-0000-000022184284
Message-Id: <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=825 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010113
Cc: mhabets@solarflare.com, rob.miller@broadcom.com, saugatm@xilinx.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, rdunlap@infradead.org, maxime.coquelin@redhat.com,
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

Ck9uIDAxLjA0LjIwIDE0OjUwLCBKYXNvbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjAvNC8xIOS4
i+WNiDc6MjEsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPj4gT24gMjYuMDMuMjAgMTU6
MDEsIEphc29uIFdhbmcgd3JvdGU6Cj4+PiBDdXJyZW50bHksIENPTkZJR19WSE9TVCBkZXBlbmRz
IG9uIENPTkZJR19WSVJUVUFMSVpBVElPTi4gQnV0IHZob3N0IGlzCj4+PiBub3QgbmVjZXNzYXJp
bHkgZm9yIFZNIHNpbmNlIGl0J3MgYSBnZW5lcmljIHVzZXJzcGFjZSBhbmQga2VybmVsCj4+PiBj
b21tdW5pY2F0aW9uIHByb3RvY29sLiBTdWNoIGRlcGVuZGVuY3kgbWF5IHByZXZlbnQgYXJjaHMg
d2l0aG91dAo+Pj4gdmlydHVhbGl6YXRpb24gc3VwcG9ydCBmcm9tIHVzaW5nIHZob3N0Lgo+Pj4K
Pj4+IFRvIHNvbHZlIHRoaXMsIGEgZGVkaWNhdGVkIHZob3N0IG1lbnUgaXMgY3JlYXRlZCB1bmRl
ciBkcml2ZXJzIHNvCj4+PiBDT05JRkdfVkhPU1QgY2FuIGJlIGRlY291cGxlZCBvdXQgb2YgQ09O
RklHX1ZJUlRVQUxJWkFUSU9OLgo+PiBGV0lXLCB0aGlzIG5vdyByZXN1bHRzIGluIHZob3N0IG5v
dCBiZWluZyBidWlsZCB3aXRoIGRlZmNvbmZpZyBrZXJuZWxzIChpbiB0b2RheXMKPj4gbGludXgt
bmV4dCkuCj4+Cj4gCj4gSGkgQ2hyaXN0aWFuOgo+IAo+IERpZCB5b3UgbWVldCBpdCBldmVuIHdp
dGggdGhpcyBjb21taXTCoGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD1hNGJlNDBjYmNlZGJhOWI1Yjcx
NGYzYzk1MTgyZThhNDUxNzZlNDJkPwoKSSBzaW1wbHkgdXNlZCBsaW51eC1uZXh0LiBUaGUgZGVm
Y29uZmlnIGRvZXMgTk9UIGNvbnRhaW4gQ09ORklHX1ZIT1NUIGFuZCB0aGVyZWZvcmUgQ09ORklH
X1ZIT1NUX05FVCBhbmQgZnJpZW5kcwpjYW4gbm90IGJlIHNlbGVjdGVkLgoKJCBnaXQgY2hlY2tv
dXQgbmV4dC0yMDIwMDQwMQokIG1ha2UgZGVmY29uZmlnCiAgSE9TVENDICBzY3JpcHRzL2Jhc2lj
L2ZpeGRlcAogIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL2NvbmYubwogIEhPU1RDQyAgc2NyaXB0
cy9rY29uZmlnL2NvbmZkYXRhLm8KICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9leHByLm8KICBM
RVggICAgIHNjcmlwdHMva2NvbmZpZy9sZXhlci5sZXguYwogIFlBQ0MgICAgc2NyaXB0cy9rY29u
ZmlnL3BhcnNlci50YWIuW2NoXQogIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL2xleGVyLmxleC5v
CiAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvcGFyc2VyLnRhYi5vCiAgSE9TVENDICBzY3JpcHRz
L2tjb25maWcvcHJlcHJvY2Vzcy5vCiAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvc3ltYm9sLm8K
ICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy91dGlsLm8KICBIT1NUTEQgIHNjcmlwdHMva2NvbmZp
Zy9jb25mCioqKiBEZWZhdWx0IGNvbmZpZ3VyYXRpb24gaXMgYmFzZWQgb24gJ3g4Nl82NF9kZWZj
b25maWcnCiMKIyBjb25maWd1cmF0aW9uIHdyaXR0ZW4gdG8gLmNvbmZpZwojCgokIGdyZXAgVkhP
U1QgLmNvbmZpZwojIENPTkZJR19WSE9TVCBpcyBub3Qgc2V0CgogCj4gSWYgeWVzLCB3aGF0J3Mg
eW91ciBidWlsZCBjb25maWcgbG9va3MgbGlrZT8KPiAKPiBUaGFua3MKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
