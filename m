Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E564954A2
	for <lists.virtualization@lfdr.de>; Tue, 20 Aug 2019 04:51:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C1442CB0;
	Tue, 20 Aug 2019 02:51:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E72D9D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 02:51:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-oln040092013094.outbound.protection.outlook.com [40.92.13.94])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A22367F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 02:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=K9m2T5iri9m1yQGxhtPj7FBqEMABC4j1IHTjMhxYWA6D/3Hzwu8GOihHZLksEthZTjQ3y+2SNtBZXnkE2XQ/P0+jVt1IfsoLO0C8+p1MhZP4/hdYFkT+1lnMDPfKtIctln1/j/zZPRIfhoS24caJfucqs9bqENnjVLi7cFN0dj0c3q43AGI7sfxDD1/+zGgI/xQgYkG3VgtP0+2tI/BIm2D62eydMxR4BLD+2OKlK5LD7rvIuTzwMDpRsYwFugnGHmZUsGE0LUi+h0yjFagKQmtjCAuhv1Zk9iL5JRBBLR1gde3tKEmFE2t1wDW7yYdVD3QCtjZ+scizHRvIeyCW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tABOCBhCVXjZYxZuobWluU3skk5NBd3K8jryq7/zorw=;
	b=J91D0JgQfh+3Ktjlzn/a9FHO/4G9ii5lpv6E9uDaDSrC/eQP3BgEiB98dtV4BTExJ+1xoLxjy3IFDRhwS2OQlYo+GtVl69bArqtPZkrmVuvsGiTPulrCJWh/+vtzi0FOzWl+XGXKK0uG90DDfcsLjsULHKwsDzHyS+cvPonpan9K4cJwolEt8M1zvy/YiG6ZCgsoTeO3DUvDM96i9lnsleu/In5A2pg7s+K0yXaVB+T3FHj8ioR+vw0wcUVQraO97atZ/xLDE45JvGblqcIKebRJDND55V8N97w1SgDVJMDCcLlTBO/dsysjeIw3aQ/kLaUCtscVw4+NmS3wvT/mcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
	dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tABOCBhCVXjZYxZuobWluU3skk5NBd3K8jryq7/zorw=;
	b=Pd1+OuikLMjrBrp4bU/Q7FF6WZuc8McCwoFP33nrDOCV6DdOWPhoqqo1nJde1UafpcvYUSTws4hVAV4MWjtEZqxNxkCf03LbOIXmisbgF6n/DEPGOBPpcxZBemQtlCPnwaBzhe9tLWQrylDvxVwjL/5CfWxFFqV01fD9CVUZVgpG9u0WEQ01nonit6mNMPDc9lL14jnGTNaxTrVV6xCVOUNRSVioNZvmlniK3tAJZChuliLx+hn9KmNuYMc03LV7aL4reF+yk+8xlXyDIlFzEe1GZEK8OJ8UB0cvdl+WQq/DTcZyWYhMQvhHEb2lQLuf0KwoeVL0tCJtrxvvPSsR+A==
Received: from BY2NAM05FT024.eop-nam05.prod.protection.outlook.com
	(10.152.100.51) by BY2NAM05HT036.eop-nam05.prod.protection.outlook.com
	(10.152.100.237) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.6;
	Tue, 20 Aug 2019 02:51:23 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com (10.152.100.52) by
	BY2NAM05FT024.mail.protection.outlook.com (10.152.100.161) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.6 via Frontend Transport; Tue, 20 Aug 2019 02:51:23 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::78fa:660d:3554:e2cf]) by
	BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::78fa:660d:3554:e2cf%7]) with mapi id 15.20.2178.018;
	Tue, 20 Aug 2019 02:51:23 +0000
From: ? jiang <jiangkidd@hotmail.com>
To: "mst@redhat.com" <mst@redhat.com>
Subject: [PATCH v3] virtio-net: lower min ring num_free for efficiency
Thread-Topic: [PATCH v3] virtio-net: lower min ring num_free for efficiency
Thread-Index: AQHVVwImlEIUBvQQWkemJT1o4Lqcdg==
Date: Tue, 20 Aug 2019 02:51:23 +0000
Message-ID: <BYAPR14MB32059DD9439280B66B532351A6AB0@BYAPR14MB3205.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR12CA0019.namprd12.prod.outlook.com
	(2603:10b6:208:a8::32) To BYAPR14MB3205.namprd14.prod.outlook.com
	(2603:10b6:a03:ab::18)
x-incomingtopheadermarker: OriginalChecksum:3E49267DEDD2505ECCB586BB7F5DD1EB8BA5CA6B1DA19D8FEA43F2C47EAB0F5B;
	UpperCasedChecksum:71AB3E86BC0E80038651A87EE1632DD6AEC983E6EE6486AAC871BAC3AAD2C8B9;
	SizeAsReceived:8158; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.11.0
x-tmn: [14WaDFP2ajGnOC6tePxqiN8kvN3vfKd5]
x-microsoft-original-message-id: <20190820025116.463-1-jiangkidd@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-ms-exchange-slblob-mailprops: b0omxY8GwpYdJXYStPR5YYqBBXLAxuB3Ei+cEXKXtII6s4rjOTw5h0p6Dawdt/dj9zSMp4goUH+4AWU+O/a08a+JmpkLKsjS0eqGfvLhqLdZNQCMRXHNR2Kz4eHvpH45f14BXDt7LdT4LWw+usUfv9GV3bMd66fun8yYQyydFVzPmtDRe1x9XdsJWoPs8cH5GEdw7up/mxuBFobTM0Kj1liHow4SdRz9g4JFf7nsHenvGJAHdnDQjOcXETWn7d9+R99zIqrmDRlhgqszkTu/8ahOBft+A4MUCa9kGKDJxdaIuSPowdLZJSyGLC7hmJqfx1kuC9X1iYI7wevIxBlSQD0AN05XiGmedERzX5fMNrMiY1bYMHbcvX/ZJoUvN/nqX5r8tef+v3//Yp4aSvzbGuC5IejtMrOITw8fsnzNr47ZUeqogNiOLEE/ZE2J2p54fInZcDF+KBAiOfeY/gwmkGj2MjAYHkSRMuKngy9fkx8VnwYLHIt9zXJRawLSdoXbzc5D+9QSAyzWq4YAbAJPTpwZkSbO49/7gAf9h4CZZI4SfvB6gW0QY2whibfn52kviDRk2fTt1V6g98ROdTrx3EOsBNKjgfGthbQ56ERMHVx07+3FQnr/29ftpIJXBbaEvEZMpVO0XcXmFBBtjBoWhwIJ3TMgAZ3NaPcztKcDtC88L4Wx9NcNnXuZ2V1uhufwEqvtCVi+XZc/u2/vsawQTkXYiqpZMeAFVifqYD0Iv5altpfEwQW899uNJbIfTUtv
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(201702181274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
	SRVR:BY2NAM05HT036; 
x-ms-traffictypediagnostic: BY2NAM05HT036:
x-microsoft-antispam-message-info: j+I4ANsbbnrpCqhE5qQdoYUTj+VJ/LJHB6f1XeCp9V4TVvrUOiVOmFV+nFgTqaOEB+/pkk/eVqpV2hbQtOlwUpk6w4dUXMflrCLgSi0VkCVAI72+soeuQJLvZr8/LTR8nb59yzrraGapNStz+89ePmrJwCFMQoc7KJIIeJJ+XptnAgt8UkoxybTcNxGH0GGD
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d20e9a-93a7-4f95-f2dc-08d725194920
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 02:51:23.1008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2NAM05HT036
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	? jiang <jiangkidd@hotmail.com>, "yhs@fb.com" <yhs@fb.com>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This change lowers ring buffer reclaim threshold from 1/2*queue to budget
for better performance. According to our test with qemu + dpdk, packet
dropping happens when the guest is not able to provide free buffer in
avail ring timely with default 1/2*queue. The value in the patch has been
tested and does show better performance.

Test setup: iperf3 to generate packets to guest (total 30mins, pps 400k, UDP)
avg packets drop before: 2842
avg packets drop after: 360(-87.3%)

Further, current code suffers from a starvation problem: the amount of
work done by try_fill_recv is not bounded by the budget parameter, thus
(with large queues) once in a while userspace gets blocked for a long
time while queue is being refilled. Trigger refills earlier to make sure
the amount of work to do is limited.

Signed-off-by: jiangkidd <jiangkidd@hotmail.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/net/virtio_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 0d4115c9e20b..bc08be7925eb 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1331,7 +1331,7 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
 		}
 	}
 
-	if (rq->vq->num_free > virtqueue_get_vring_size(rq->vq) / 2) {
+	if (rq->vq->num_free > min((unsigned int)budget, virtqueue_get_vring_size(rq->vq)) / 2) {
 		if (!try_fill_recv(vi, rq, GFP_ATOMIC))
 			schedule_delayed_work(&vi->refill, 0);
 	}
-- 
2.11.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
