Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 14760716723
	for <lists.virtualization@lfdr.de>; Tue, 30 May 2023 17:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A53F240531;
	Tue, 30 May 2023 15:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A53F240531
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=WrLNArUv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Eothk6gM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewxft4ErRZFH; Tue, 30 May 2023 15:34:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2495A40377;
	Tue, 30 May 2023 15:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2495A40377
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BBF9C008C;
	Tue, 30 May 2023 15:34:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 128D3C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 May 2023 15:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB47981E8B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 May 2023 15:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB47981E8B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=WrLNArUv; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=Eothk6gM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q33JAkZ_s-FC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 May 2023 15:34:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDA681E59
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFDA681E59
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 May 2023 15:34:42 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UE54BX020898; Tue, 30 May 2023 15:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=Ixl+3WAXB+62LkfSal/++HTeYlpN5BILEtsgGx+Bbg4=;
 b=WrLNArUvAGXM2mQuu2hpPMwzqwHRvU8gyuC48rzBLNZiEFlMUcbu+2H5CykF9qykQO8n
 AUiLJzvwRTI8X1zRzh8jvIK2Qjfk2b2m27Gd48sDDNVBk65ZMWZq2g8rdnxcYZ4Oo5S+
 4p6s06+avgcjEu0oeDA8NrWObpP4NJIUsbpMfhsMhR/oVWTzRcwYUXI7xnmOM1EHzRvG
 wepIm8+G3fCzB9jeeoj8SAljA+n/NumT+4SSMa4dKRfs8xoyknZCU5ZHB8TwihdrkMOD
 NDdpbJ+T89N2+0VLYOQZ0TKkPThN+xwvu0XnvOYpm8ZzLM399EPT4dlb1Z5KpbCr2Y11 7Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qvhb934gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 May 2023 15:34:31 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 34UEPTWC014712; Tue, 30 May 2023 15:34:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3qu8a427e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 May 2023 15:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9LDJwBl6JG/7T0M7v8seTDuTFDMLNmvLKJ0WAFtEPsQ571+Xb6y6YB/2PkSCud/om5rZAZuAocFQXT6GQhOG2TvyU8nSima9uoCZhzhYFdvQRb5Qm9CZidgXrikBtBkAjWT+rkuoQTLYWWVpvIFv8IBFE7TevPZszdwI/pi2j1syCVdAS8QA0AlF6oQweNezoEDnkPNg4xY7bWAjQI3rodMCf42igMlyI56qsx7PQE2+Hhg43YK3Ugff5Q8BAxY72MGuRTpzQUiJ7j5hYiQGjISVYwgQMurk2oL4bEEguOoMLrvWAOn7odLzKPc/XVccDprwN6kz44EwaepgEcBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixl+3WAXB+62LkfSal/++HTeYlpN5BILEtsgGx+Bbg4=;
 b=GemKWrysGXwf/yIJQ8RMR/8Xr8N/1+bX3cJ09/T1n2eIKuQY0upPpmN4E5vQHfwt0CBiU1avx+1EfbTfRsG/teHCk6wuumKtza/sY76p7g4O9Nm+qIagVhfuG9cmAAJKgZTzH+dNLoTKXmmM7bLRxh4t/qhwbopzLUxub5B4mrAruaDLMkNBiOHUWrmQMTDVO0mNlsdDeetsh40rONr1jNXccuorUzw8nZuvBmJdvT3WWH4VZll+ePiR6R/a8gN9TfbzoqOOcFWN9bm6vh1EQo2FjsRtstD50IA3aeUEAB5HLAhpuQUfgoP0uTnIfxGqsrVgbczLgMHl1Wc3x/mzbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixl+3WAXB+62LkfSal/++HTeYlpN5BILEtsgGx+Bbg4=;
 b=Eothk6gMt48oWmKU4FBb4J6a5e6n4U2eNJKkaVWmKxUT8Q5gJxl1t2CUYDTdLYLIEzveYQBYFRp9hBHVd0X60gNPQlRaGg2dUGrBu61Ob8LN1AMDBjvzKfu7OIqFYTuwJtJmkfyLi9w2/ofcD7aPXlDyKBqLGDBlK28FI8mrpqE=
Received: from CY8PR10MB7243.namprd10.prod.outlook.com (2603:10b6:930:7c::10)
 by IA1PR10MB6830.namprd10.prod.outlook.com (2603:10b6:208:426::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:34:28 +0000
Received: from CY8PR10MB7243.namprd10.prod.outlook.com
 ([fe80::13d6:c3f3:2447:6559]) by CY8PR10MB7243.namprd10.prod.outlook.com
 ([fe80::13d6:c3f3:2447:6559%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 15:34:28 +0000
Message-ID: <60410476-9d6c-8969-4713-e889cfc4b175@oracle.com>
Date: Tue, 30 May 2023 10:34:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] fork, vhost: Use CLONE_THREAD to fix freezer/ps
 regression
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <20230523121506.GA6562@redhat.com>
 <87bkib6nxr.fsf@email.froward.int.ebiederm.org>
 <20230524141022.GA19091@redhat.com>
 <87ttw1zt4i.fsf@email.froward.int.ebiederm.org>
 <20230525115512.GA9229@redhat.com>
 <87y1lcxwcj.fsf@email.froward.int.ebiederm.org>
 <CAHk-=wj4DS=2F5mW+K2P7cVqrsuGd3rKE_2k2BqnnPeeYhUCvg@mail.gmail.com>
 <87cz2mrtnk.fsf@email.froward.int.ebiederm.org>
 <CAHk-=whsi9JFP-okH3jXHrA8rh8bMuuSt6ZgkmPwiDMAn437qA@mail.gmail.com>
 <87mt1pmezu.fsf@email.froward.int.ebiederm.org>
 <20230529111859.GA15193@redhat.com>
 <022f4de6-9eae-0a94-0f55-b84be4982fc3@oracle.com>
 <87sfbeh7b5.fsf@email.froward.int.ebiederm.org>
Content-Language: en-US
From: Mike Christie <michael.christie@oracle.com>
In-Reply-To: <87sfbeh7b5.fsf@email.froward.int.ebiederm.org>
X-ClientProxiedBy: DS0PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:8:191::18) To CY8PR10MB7243.namprd10.prod.outlook.com
 (2603:10b6:930:7c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB7243:EE_|IA1PR10MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 853253aa-2093-4332-23e9-08db61235b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMUUiJ8GeWXaWFwd/cqod1apht3o0LyeEEINeWJwr5p4jy29F3KkUKmiTZjCxq/h3mSlfci3vjscPRcUsecY5T1FAxeXOYfFVGUr2DGFSNTWF40AOzopuQ/17a4muMUa6Eb6IBjgsqGyVhOQrBN/kf9eCQKDv+kkGd/xNyJsxgJodpghtC7euxjde+OVNE6WZp6i6lIC6gsMaz6WcGJh8QlReP/+fE+Lk24Tw5rcTSpGvFXNKBAfWg2OQHdd/YCbAAKwtKjxm1Bxu6rbYxFF16aNjGcMmfwUDROaQ5zr1CNTqCPrSMem/Qrm/Mf8zhk3EEi2SsSctlNIuWBIVuQReFjSYTEFo4jX82VVJMNm6YCdqR4otpLpOFnKktNY30PMsiPImmIeaEemU4Nl84/KgVG3AxYcfelspL8EiQryqe5/PaNYRSJlIjgmJulEPIYK1Wie0XlgKZk+iXQheMDB2mnc8xUxH9AnpCA9UuF3TnMTt9iki75jWjw6VSP9Q3GXWEoeqqh1xj4MyFeNYqvRVOxBMhpaBbDxvtUJEk0OOp3kzUw27/xb+lT7oyUDJyDEvA4GHuvtVMyWfJ7Rsi/UfdasZEoJKKPiq3pmCxFbfUWj4pSA2T3g0cAnrl8fZit7AiT0UwdQsvQ9jS03abedXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR10MB7243.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(36756003)(86362001)(5660300002)(66946007)(558084003)(66476007)(316002)(66556008)(7416002)(4326008)(6916009)(31696002)(8676002)(6486002)(8936002)(38100700002)(41300700001)(53546011)(54906003)(2906002)(2616005)(6512007)(6506007)(186003)(31686004)(478600001)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3UreUV6TWpneU95TWhVNzN5SlNWakdiWW5IOUdTeHBFcERja29qWmR2UlNx?=
 =?utf-8?B?eVdKb0xMRk5iVFJmTVdndC9MWlVVRjR5OCtPTHNrc2IyY3FxWVY0T1M4RTJy?=
 =?utf-8?B?c3ZKUlN2K3NWQ0c1VlVFQm5oWUhpZXlTc012SzJ2RjRJa3liV3Z6VE95anZp?=
 =?utf-8?B?SG5tM0Y3bWwwU2VuR2FPbS94cElVdk1YZ0g0NVJwdnUxaTJFMGNZWldkL2tw?=
 =?utf-8?B?bEdrQm04bFhaZTgxYkQ0S0dRTDI5VytJSUl2elltUHNtODErZlRwUWRBbVg4?=
 =?utf-8?B?QXpjRlZlajRBTzdOVmhudFhOeHJFZ2hjMTRiNytuS0xNYzZRK1pzcGNSQmdh?=
 =?utf-8?B?eUEydFd4TUtzcjJPcXA5dDdCclNTblNNZitISXJhNWc5VmMwRzhxNnZtMHhx?=
 =?utf-8?B?NHZWcGovOW5CbVdCa2pOZzh3ejNFWDExV3NTUXErV3dQVlJ6akQvejJFQjRO?=
 =?utf-8?B?VDhvTXZsK09ZRUwvdWtXMmFmN015RDVVZDNiNHFWeEgvbUNnT2VqWVdyS205?=
 =?utf-8?B?bVJxYy8rWkxtckNSR0dLWll4MVM0c1k3SDRyYVZXakY4VjBPaFdQbEhNSmc0?=
 =?utf-8?B?OEdkUDNrc1E3TENUVzFMUHROMXZLRHg4T1BSNDhJNXpyMUMweG9RRDYxdUdR?=
 =?utf-8?B?cWhFVjN6cFNmN2dmUkdsbXRhekt2OU5XVnlxRVI4LzlrbEZWRTRNeUdILytl?=
 =?utf-8?B?M2Z0UlpjTUx1czlBS292UWFMQUlzVkZkT014SVl4T01GQ1ZvREpNcUNKN3U2?=
 =?utf-8?B?a1cyd1JjNWh3S1huUFZOenFFUDhub1RtZDR5bCtFdHZlSlZ2MW9ET3UwejNR?=
 =?utf-8?B?LzVmcnhHMVd2TURlTzZTYXAvbThSb3RYVzdwZDBKY2l5WWt6SUFqRXJCTHU5?=
 =?utf-8?B?Uzlqd3kzRE1RY1hxUWZDSWNZN0JwRUVUWU40S1ZYL2hDdXdacGY3NldEWlFZ?=
 =?utf-8?B?alhuYTh6QnA0VkU4QnVVMVFyaGpiYzJTTnlZV0xraDFkNGdsYmExcjBHMnd0?=
 =?utf-8?B?RWQwQ0J3Rk1zeGI0eTFMM3k0KzM3Uks2ckIvM1hIMk5HbmREZGZhYzhGbTQr?=
 =?utf-8?B?TTJJSm9uZFkvZGtEQmtLdXBWUU5Bb0d4Z2tWSFlpZzh2TnZVWUgzdFZrOS9j?=
 =?utf-8?B?bUE1NDViLzJQQzNRTU4vTmk1dXNrNXJJQzlPV242czhHcEhsMHc3SXluS1l1?=
 =?utf-8?B?QXBnVWZGS0lUb0NYL1JyZFZBQTVaWmIvSGppZTQybkcxMHczNGlRU2IxVDNi?=
 =?utf-8?B?OU80NlltTlZnUWJBMldYTW91ZVlsaHhxSE9ad0Z3elUrcEdRcjdhS1JEY1hB?=
 =?utf-8?B?UzhtS0hkenluMHRiSWZaMEp5b0VxZkJmZVdPMVNiRVlWbmhWUFYvZEw1b1d2?=
 =?utf-8?B?Nk1rWlQyUnNpZkRqaTN3RUNNdzRTc3dqQjQ2N0pPSzFYWDg3eDBCK3J4dG1K?=
 =?utf-8?B?dWxOWDQ1R3BtUGhxekxvQXo4UW93Nlo1N1hWUXE1dE55b0xZMkQvZUlHTkpT?=
 =?utf-8?B?YWdpYjRZTTBTalhzVWF3cHNUaUZ5SFo3VkR5WUlsTWhUM3hObjR1aTQ0K3JJ?=
 =?utf-8?B?c3k4T052R2FmeGpGaHpHRHFJcWk2N1RmRGR3NkZ5MUxqK1JzWEtZZVVyTm9v?=
 =?utf-8?B?K211RkxuanMyRWtlUEs3VWV4dVEyMURNK1A3VFkrVFhuSEZ6N1hrNU1oS20w?=
 =?utf-8?B?WVRvWmQ4Q2NjSnJGdWRxVEx2eDZ3VGxpdkVsRmREV0xJa0liVkZlQTVQVHV0?=
 =?utf-8?B?NCt3OWVrV0lHeFZFcFF3bTNtZ2kzQTNyeVRLN3hhMTVONzR2bmpzZVdSckRT?=
 =?utf-8?B?VzRMeVc1ckdqVytneVVJS1d1WTVZYk9qSExPNXhaSE1jODYwWjdjQjJEd0Z1?=
 =?utf-8?B?d1FwQTI4WmlMTlJyekNTVmZJZFp4d1ZybDV5VVl5eFgzNFNXYWNOMFl2bTBZ?=
 =?utf-8?B?YzRpdSsxSW1HbXZsUE5sMkxGNzEwK095ajBxeUlNeW9kVHVQcnlnS00vTEdi?=
 =?utf-8?B?eTFlWDIrOEVnaTNnc0xhUHlSUGY3TVpYTThrVjQxcEVTa2FvR3E5bjlxV09W?=
 =?utf-8?B?eFkwSlNVS3VjNURtc09rSStSaWhTaEZQM1lNdHNUZU9scmJJcnBKaTV4Nkxo?=
 =?utf-8?B?Uzl0ZDVjdisyZkNneGtaNVdQeWtCS05TUW5DUms1SmUyaCtyeTdyTlU1UHhu?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?bzVUakFoRks1a3FlNWNzNUoxVjNjTlA2Sk1MYjdKQnZPZlBmY1U4OE1QSUs2?=
 =?utf-8?B?UCs0NktBWStGb1hNdGs0SXl1a3Nwck5XSW9paHhVejk4VnZYY1k5Wk9tazlq?=
 =?utf-8?B?T2RMNmNiUE5yeFp0TTkvdHpkS3p1MXN6b0tOWjBnbFhyTWpzc3R5ZnMrNEJl?=
 =?utf-8?B?eDFoNHU4dUlweEc5NDNPRWpYWWJVNjZoaGpzcFE4QS9uWno4NDRyWGxnSmRT?=
 =?utf-8?B?bE5qVUhGenR3WlpLalZ6ZGh5VWdBSnp0UWJIYUJXa3U0dlAvTlJhN2R6cFZM?=
 =?utf-8?B?TkdpWkRmRTlyUTh4TXZpTzJxNnZVSnIrdFl5Wlkyb0Q2VGZVOHBMdXRCK0to?=
 =?utf-8?B?clQvWEw4WUpTSjNveUVlVmxuV3pST21kblc1TFNxby9YOUhuM1NrMDlyUHNK?=
 =?utf-8?B?R3VWSVFtemtnQnAyOXEyblJhbm9TUEhEbjZuRnIzbmY1MmhlUzMrUFd3RkNK?=
 =?utf-8?B?UzFtbDdYRjZpTUVsZW1hQjFEQ2FFa0hKSVhNL2o5TWhrWXhXMDFBT3dDTElN?=
 =?utf-8?B?OUNyamxzWE5mYXBORUYzR3JsWUVYZSsxOHg1U3BxdGxsLzJ0c2FVN3Jab0lx?=
 =?utf-8?B?RkVEWWhDOHpybERUVHhjbEpvNWEyMlFPV2NpTlZ4UlNESlBFRDVFRjU0b3JE?=
 =?utf-8?B?WUpKM0VRRHRaQ0o0dHl0YzhJWEpWZXhxdnpiRlIxMFoxR21DUmg1R2lvVC95?=
 =?utf-8?B?WXVpSWRuejNSdk83aVRKSVBjWWlTUG9pWFdEUTMrZzU1Y2xNT2EzN2FCdW9y?=
 =?utf-8?B?UHpDTTBQT3R5eTBJdmdzVWRYNmZFSFRjZ1VpRnZiZFFYS1FJRGlFQVptaG43?=
 =?utf-8?B?eENrZVBubTNhN2p2elBkR1BkdXg2ekROSElxcnhXaDZJNUVYUCt2b3RmZ2dM?=
 =?utf-8?B?RUhmRTVEWlJ6U1hCbmNlU0JwZU01VTVkeHdtYXZxZ3A0endDRXZ4WDd6QVRh?=
 =?utf-8?B?L2pBTnoyL0grcFlBTHJHczI4SlpldG1jQXZRd296K3hub2FpaGxRRjhlSUJa?=
 =?utf-8?B?ZEovQVR3cTBYNEorSllVU1lrZHhHVU9PMVhWcGlGSWRya205MjFsRkNYRlpL?=
 =?utf-8?B?V1dUa1Qwc1ZSQ2pISkh0bVBybWtEclBQYysvdmYvZlFQenVVd3dRM0ZYWU5T?=
 =?utf-8?B?Z1dpUXYyTFRIY0JDeStZVmo5R24yL0xXQVk1TXNNeURIL01BTlhSbmVGaHRV?=
 =?utf-8?B?SjllOHR2OFo0Yis1M3hyVkFBOTVSdStYUWdhMEhldFZOSmtBM08wOGtvLzFx?=
 =?utf-8?B?L3dCRi9RcUVtVzk3YVVsNUdDdERhM2xHeUQ3Q2w0UXh3blY1V3J2eFhqWGZ2?=
 =?utf-8?B?U216MnQxemZnek5PQzNQNE1pTTlMSEYxM296NWFKck0vdTFzeTRBeWU2T3Zt?=
 =?utf-8?B?bjArQkFJdFVtcDF1VkdSZUZmSnRvS0ZteHJWQjBSaHdNYXdVN3FMSVFYSFBS?=
 =?utf-8?Q?L6iMbA1M?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853253aa-2093-4332-23e9-08db61235b3f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB7243.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:34:28.7562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypCcb9mVfjIvBgrJZk1sf1QEUuR85wOBUewdmaEDZDdoJEf1MbpO6r3r041PnAtFGojXPEkH4F3rJkOCJT/esWpqU/5SsRjjnS5zwtiWmPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6830
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_11,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxlogscore=827 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305300125
X-Proofpoint-GUID: TqO1HKw8moqJhvOl1BlEmp_FmO0FEFvJ
X-Proofpoint-ORIG-GUID: TqO1HKw8moqJhvOl1BlEmp_FmO0FEFvJ
Cc: axboe@kernel.dk, brauner@kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 stefanha@redhat.com, linux@leemhuis.info, nicolas.dichtel@6wind.com,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 5/29/23 9:38 PM, Eric W. Biederman wrote:
> Mike is there any chance you can test the change below?

Yeah, I'm firing up tests now.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
